httpProxy = require 'http-proxy'
fs = require 'fs'

module.exports =
  loadConfig: () ->
    @configPath = "#{process.env.PWD}/config.json"
    unless fs.existsSync @configPath
      process.exit()
    @setConfig(JSON.parse fs.readFileSync(@configPath))
    console.log @config

  setConfig: (config) ->
    @config = config
    @config.host = @config.host || 'localhost'

  startProxyServer: ->
    httpProxy.createServer((req, res, proxy) =>
      proxy.proxyRequest req, res,
        host: @config.host
        port: @config.dest
    ).listen @config.listen
    console.log "Starting Server at http://#{@config.host}:#{@config.listen}"
