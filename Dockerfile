FROM mitmproxy/mitmproxy:5.0.1
RUN apk update &&\
    apk add git
RUN git clone https://github.com/KevCui/mitm-scripts.git /home/mitmproxy/mitm-scripts
WORKDIR /home/mitmproxy/mitm-scripts
