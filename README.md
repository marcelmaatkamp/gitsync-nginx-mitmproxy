# mitmproxy with mitm-scripts
Container with mitmproxy combined with https://github.com/KevCui/mitm-scripts 

# installation

## mitmproxy

Use just plain docker to start mitmproxy:
```
% docker run --rm -ti \
  -p 8080:8080 \
 marcelmaatkamp/mitmproxy-scripts \
  mitmproxy \
   --listen-host 0.0.0.0 \
   --listen-port 8080
```
and watch the console output. There is also `mitmweb` which will create a web-interface with all the requests, to start that use the following:

## mitmweb
Use just plain docker to start mitmweb
```
$ docker run --rm -ti \
  -p 8080:8080 \
  -p 8081:8081 \
 marcelmaatkamp/mitmproxy-scripts \
  mitmweb \
   --web-iface 0.0.0.0 
```
And goto http://localhost:8081 to view the web-interface.

## browser
Now set a proxy in your browser for both HTPP and HTTPS and point it to http://localhost:8080 and goto http://mitm.it/ and download the appropiate certificate from mitmproxy called `mitmproxy-ca-cert.pem`

## cUrl
Or download the certificate with cUrl: 
```
$ http_proxy=http://localhost:8080 \
  https_proxy=http://localhost:8080 \
  curl -so ~/Downloads/mitmproxy-ca-cert.pem http://mitm.it/cert/pem
```
Now it is time to do some nifty mitmproxy and python wizardry! :)

# Usage
https://github.com/KevCui/mitm-scripts contains python example scripts. One of the more useful scripts is the `mitm-redirect-host.py` and `mitm-redirect-url.py`. Lets say a (node/java/whatever) library contains a hardcoded reference to another library but that one is deleted/moved/temporary not available and you don't have the source code at hand. A very quick fix would be to redirect just that request to your own webserver.

| Script | Usage |
| -- | -- |
| mitm-redirect-host.py | Script to redirect hosts requests according to rules defined in `rewrite-router.yaml` |

## mitm-redirect-host.py
This python script will rewrite requests according to the rules defined in `rewrite-router.yaml`. See https://github.com/KevCui/mitm-scripts#mitm-redirect-host--mitm-redirect-url

```
# https://www.google.com/.*: example.com
```

### start mitm-redirect-host.py
```
% docker run --rm -ti \
  -p 8080:8080 \
  -p 8081:8081 \
 marcelmaatkamp/mitmproxy-scripts \
  mitmweb \
   --web-iface 0.0.0.0 \
   --set termlog_verbosity=warn \
   -s mitm-redirect-host.py
 
Web server listening at http://127.0.0.1:8081/
No web browser found. Please open a browser and point it to http://127.0.0.1:8081/
Loading script mitm-redirect-host.py
Proxy server listening at http://*:8080
```

### run example nodejs application
Now its time to inspect the requests while building:
```
$ http_proxy=http://localhost:8080 \
  https_proxy=http://localhost:8080 \
  NODE_EXTRA_CA_CERTS=~/Downloads/mitmproxy-ca-cert.pem \
  npm install
```
