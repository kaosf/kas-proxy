assert = require 'assert'

kasProxy = require '../coffee/index'

describe 'kasProxy', ->
  describe 'setConfig method', ->
    it 'with minimal parameters', ->
      kasProxy.setConfig
        listen: 10000
        dest: 9000
      assert.strictEqual kasProxy.config.listen, 10000
      assert.strictEqual kasProxy.config.dest, 9000
      assert.strictEqual kasProxy.config.host, 'localhost'
    it 'with host attribute', ->
      kasProxy.setConfig
        listen: 10000
        dest: 9000
        host: 'example.com'
      assert.strictEqual kasProxy.config.listen, 10000
      assert.strictEqual kasProxy.config.dest, 9000
      assert.strictEqual kasProxy.config.host, 'example.com'
