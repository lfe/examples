FROM lfex/yaws-dev

COPY . /lfeyawsdemo/
WORKDIR /lfeyawsdemo
RUN rebar3 compile && \
    mkdir ebin log && \
    rm -rf _build/default/lib/yaws

ENTRYPOINT [ "./bin/start" ]