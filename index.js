httpProxy = require('http-proxy');

module.exports = {
  startProxyServer: function() {
    httpProxy.createServer(function(req, res, proxy) {
      proxy.proxyRequest(req, res, {
        host: 'localhost',
        port: 9000
      });
    }).listen(10000);
    console.log('Starting Server at http://localhost:10000');
  }
};
