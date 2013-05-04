httpProxy = require 'http-proxy'
fs = require 'fs'

configPath = "#{process.env.PWD}/config.json"
unless fs.existsSync configPath
  console.log "config.json doesn't exist."
  process.exit()

config = JSON.parse fs.readFileSync(configPath)

module.exports =
  startProxyServer: ->
    httpProxy.createServer((req, res, proxy) ->
      proxy.proxyRequest req, res,
        host: 'localhost'
        port: config.dest
    ).listen config.listen
    console.log "Starting Server at http://localhost:#{config.listen}"
