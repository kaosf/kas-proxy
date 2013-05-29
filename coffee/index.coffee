argv = require 'argv'
httpProxy = require 'http-proxy'
fs = require 'fs'

args = argv.option(
  [
    {
      name: 'config'
      short: 'c'
      type: 'path'
      description: 'config file path'
      example: "'kas-proxy -c path/to/config.json'. default: ./config.json"
    }
  ]
).run()

module.exports =
  loadConfig: () ->
    @configPath = args.options.config || "#{process.env.PWD}/config.json"
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
