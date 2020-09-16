FROM lfex/yaws-dev

COPY . /yaws-web-app-example
WORKDIR /yaws-web-app-example
RUN rebar3 compile && \
    mkdir ebin log && \
    rm -rf _build/default/lib/yaws

ENTRYPOINT [ "./bin/start" ]