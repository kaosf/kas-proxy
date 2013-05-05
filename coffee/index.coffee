httpProxy = require 'http-proxy'
fs = require 'fs'

module.exports =
  loadConfig: () ->
    @configPath = "#{process.env.PWD}/config.json"
    unless fs.existsSync @configPath
      process.exit()
    @config = JSON.parse fs.readFileSync(@configPath)
    console.log @config
  startProxyServer: ->
    httpProxy.createServer((req, res, proxy) =>
      proxy.proxyRequest req, res,
        host: 'localhost'
        port: @config.dest
    ).listen @config.listen
    console.log "Starting Server at http://localhost:#{@config.listen}"
