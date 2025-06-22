# Inspired from https://github.com/jamesagarside/openmaxio-object-browser


##
## Build web-app
FROM node:20 AS web-app

WORKDIR /app
COPY . .

RUN corepack enable \
  && corepack prepare yarn@4.4.0 --activate \
  && cd web-app \
  && yarn install \
  && yarn build


##
## Build console
FROM golang:1.23-bookworm AS console

WORKDIR /app
COPY . .
COPY --from=web-app /app/web-app/ /app/web-app/

RUN make console


##
## Output
FROM alpine:3.22.0

WORKDIR /app

COPY --from=console /app/ /app/

ENTRYPOINT ["/app/console", "server"]
