FROM golang:1.20-alpine AS builder

WORKDIR /app

RUN go mod init go-docker-project

COPY main.go .

RUN go mod tidy && go build -o main .

FROM scratch

COPY --from=builder /app/main /main

CMD ["/main"]
