FROM golang:alpine AS builder

COPY app /go/src/app

WORKDIR /go/src/app

ENTRYPOINT [ "go", "run"]

CMD [ "FulCycle.go" ]