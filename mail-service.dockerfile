FROM golang:latest as builder


RUN mkdir /mailing
WORKDIR /mailing

ADD . ./mailing
COPY . .

COPY Makefile go.mod go.sum .env ./
COPY .env ./cmd/

# Builds your app with optional configuration

RUN go build -o mail-service ./cmd/api

# Tells Docker which network port your container listens on
EXPOSE 8084

# Specifies the executable command that runs when the container starts
CMD [ "/mailing/mail-service"]