var args, argv, fs, httpProxy;

argv = require('argv');

httpProxy = require('http-proxy');

fs = require('fs');

args = argv.option([
  {
    name: 'config',
    short: 'c',
    type: 'path',
    description: 'config file path',
    example: "'kas-proxy -c path/to/config.json'. default: ./config.json"
  }
]).run();

module.exports = {
  loadConfig: function() {
    this.configPath = args.options.config || ("" + process.env.PWD + "/config.json");
    if (!fs.existsSync(this.configPath)) {
      process.exit();
    }
    this.setConfig(JSON.parse(fs.readFileSync(this.configPath)));
    return console.log(this.config);
  },
  setConfig: function(config) {
    this.config = config;
    return this.config.host = this.config.host || 'localhost';
  },
  startProxyServer: function() {
    var _this = this;

    httpProxy.createServer(function(req, res, proxy) {
      return proxy.proxyRequest(req, res, {
        host: _this.config.host,
        port: _this.config.dest
      });
    }).listen(this.config.listen);
    return console.log("Starting Server at http://" + this.config.host + ":" + this.config.listen);
  }
};
