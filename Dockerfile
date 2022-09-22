FROM alpine

WORKDIR /app

COPY ./build.sh ./entrypoint.sh ./

RUN  \
    apk add -U --no-cache --upgrade && \
    apk add -U git wget autoconf automake autoconf-doc udns udns-dev curl gcc libc-dev libevent libevent-dev libtool make openssl-dev pkgconfig postgresql-client && \
    chmod +x ./build.sh ./entrypoint.sh && \
    ./build.sh && \ 
    mkdir -p /etc/pgbouncer && \ 
    chown -R postgres:root \
        /etc/pgbouncer

USER postgres

ENV PGBOUNCER_LISTEN_PORT=5432

EXPOSE 5432

CMD [ "./entrypoint.sh" ]
