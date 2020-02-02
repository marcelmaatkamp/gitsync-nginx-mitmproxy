# gitsync repositories with nginx and mitmproxy

# installation
```
$ docker-compose up
```
Set proxy in browser to http://localhost:8080 and goto http://mitm.it/ and install certificate in `~/Downloads/mitmproxy-ca-cert.pem`

# Usage

## Example application
https://github.com/strapi/strapi-examples/tree/master/login-react/react-login-front-end-app but could literally *any* application/library you would want to observe.

```
# step 1: download application
$ git clone https://github.com/strapi/strapi-examples &&\
  cd strapi-examples/login-react/react-login-front-end-app

# step 2: install and observe mitmproxy logs
$ http_proxy=http://localhost:8080 \
  https_proxy=http://localhost:8080 \
  NODE_EXTRA_CA_CERTS=~/Downloads/mitmproxy-ca-cert.pem \
  npm install
```

## mitmproxy logs
```
mitmproxy_1  | https://registry.npmjs.org/babel-plugin-transform-es2015-modules-commonjs
mitmproxy_1  | https://registry.npmjs.org/add-asset-html-webpack-plugin
mitmproxy_1  | https://registry.npmjs.org/babel-cli
mitmproxy_1  | https://registry.npmjs.org/babel-loader
mitmproxy_1  | https://registry.npmjs.org/babel-plugin-react-intl
mitmproxy_1  | https://registry.npmjs.org/babel-core
mitmproxy_1  | https://registry.npmjs.org/babel-eslint
mitmproxy_1  | https://registry.npmjs.org/babel-plugin-dynamic-import-node
mitmproxy_1  | https://registry.npmjs.org/babel-plugin-styled-components
mitmproxy_1  | https://registry.npmjs.org/babel-plugin-react-transform
mitmproxy_1  | https://registry.npmjs.org/babel-plugin-transform-es2015-modules-commonjs/-/babel-plugin-transform-es2015-modules-commonjs-6.24.1.tgz
mitmproxy_1  | https://registry.npmjs.org/add-asset-html-webpack-plugin/-/add-asset-html-webpack-plugin-2.0.1.tgz
mitmproxy_1  | https://registry.npmjs.org/babel-plugin-styled-components/-/babel-plugin-styled-components-1.1.4.tgz
...
```

# Extra information

# mitmproxy
https://github.com/KevCui/mitm-scripts

## url rewrite
