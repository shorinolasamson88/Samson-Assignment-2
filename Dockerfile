FROM alpine:3.24.2

WORKDIR /app

COPY . .

RUN apk update && apk add --no-cache \
    bash \
    grep \
    musl-utils \
    util-linux 

RUN chmod +x app/diagnostic.sh

ENTRYPOINT [ "bash", "app/diagnostic.sh" ]


