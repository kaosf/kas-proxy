var fs, httpProxy;

httpProxy = require('http-proxy');

fs = require('fs');

module.exports = {
  loadConfig: function() {
    this.configPath = "" + process.env.PWD + "/config.json";
    if (!fs.existsSync(this.configPath)) {
      process.exit();
    }
    this.config = JSON.parse(fs.readFileSync(this.configPath));
    return console.log(this.config);
  },
  setConfig: function(config) {
    return this.config = config;
  },
  startProxyServer: function() {
    var _this = this;

    httpProxy.createServer(function(req, res, proxy) {
      return proxy.proxyRequest(req, res, {
        host: 'localhost',
        port: _this.config.dest
      });
    }).listen(this.config.listen);
    return console.log("Starting Server at http://localhost:" + this.config.listen);
  }
};
