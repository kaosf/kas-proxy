var config, configPath, fs, httpProxy;

httpProxy = require('http-proxy');

fs = require('fs');

configPath = "" + process.env.PWD + "/config.json";

if (!fs.existsSync(configPath)) {
  console.log("config.json doesn't exist.");
  process.exit();
}

config = JSON.parse(fs.readFileSync(configPath));

module.exports = {
  startProxyServer: function() {
    httpProxy.createServer(function(req, res, proxy) {
      return proxy.proxyRequest(req, res, {
        host: 'localhost',
        port: config.dest
      });
    }).listen(config.listen);
    return console.log("Starting Server at http://localhost:" + config.listen);
  }
};
