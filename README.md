# Ka's Proxy

Very easy and simple proxy server.

## Usage

Installation.

```sh
npm install -g https://github.com/kaosf/kas-proxy/tarball/v0.0.2
```

Usage.

```
echo '{"listen": 10000, "dest": 9000}' > config.json
kas-proxy
```

## Development

Clone the repository, and then install development tools. Do this process at only the first time.

```sh
# clone this repository and cd into its directory.
# for example;
git clone https://github.com/kaosf/kas-proxy
cd kas-proxy

# install Node.js v0.8.19.
# for example;
nodebrew install v0.8.19
nodebrew use v0.8.19

# install Grunt.
npm install -g grunt-cli@0.1.7

# install some packages for development.
npm install
```

Change code, and then build and test.

```sh
# change code with your favorite text editor.
# for example;
vim coffee/index.coffee
emacs test/index.coffee

# build and test.
grunt
```

Execute this application to confirm the behavior with one of the following commands.

```sh
./bin/kas-proxy
```

```sh
npm install -g ./
kas-proxy
```

## References

* [nodejitsu/node-http-proxy](https://github.com/nodejitsu/node-http-proxy)

## License

[MIT](http://opensource.org/licenses/MIT)
