FROM lfex/yaws:latest

COPY . /lfeyawsdemo/
WORKDIR /lfeyawsdemo
RUN apk add --update git && \
    rebar3 compile && \
    mkdir log && \
    apk del git && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "./bin/start" ]