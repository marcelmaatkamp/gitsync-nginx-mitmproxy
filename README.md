# mitmproxy with mitm-scripts
Container with mitmproxy combined with https://github.com/KevCui/mitm-scripts 

# installation
```
$ docker-compose up
```
Set proxy in browser to http://localhost:8080 and goto http://mitm.it/ and install certificate in `~/Downloads/mitmproxy-ca-cert.pem`

# Usage

| Script | Usage |
| -- | -- |
| mitm-redirect-host.py | Script to redirect hosts requests according to rules defined in `rewrite-router.yaml` |

## mitm-redirect-host.py
This python script will rewrite requests according to the rules defined in `rewrite-router.yaml`. See https://github.com/KevCui/mitm-scripts#mitm-redirect-host--mitm-redirect-url

```
# https://www.google.com/.*: example.com
```

### usage
```
% docker run --rm -ti \
  -p 8080:8080 \
  -p 8081:8081 \
 marcelmaatkamp/mitmproxy-scripts \
  mitmweb -s mitm-redirect-host.py  
  
Web server listening at http://127.0.0.1:8081/
No web browser found. Please open a browser and point it to http://127.0.0.1:8081/
Loading script mitm-redirect-host.py
Proxy server listening at http://*:8080
```

Goto http://localhost:8081:
<image>

### Usage

## Example applications

### nodejs
```
$ http_proxy=http://localhost:8080 \
  https_proxy=http://localhost:8080 \
  NODE_EXTRA_CA_CERTS=~/Downloads/mitmproxy-ca-cert.pem \
  npm install
```



