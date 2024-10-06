# syntax=docker/dockerfile:1

FROM golang:1.22 AS build-stage
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY app/*.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /12factor


FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-stage /12factor /12factor

EXPOSE 5005

USER nonroot:nonroot

ENTRYPOINT ["/12factor"]


