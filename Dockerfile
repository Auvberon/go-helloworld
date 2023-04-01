FROM golang:1.16-alpine AS build
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY . .
RUN go build -o app .

FROM alpine:3.14
WORKDIR /root
COPY --from=build /app/app .
RUN ls -al
CMD /root/app