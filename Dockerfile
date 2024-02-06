FROM rust:1.75 as builder

COPY . /dbgen
WORKDIR /dbgen

RUN cargo install --path .

FROM ubuntu:22.04

RUN apt-get update -yy && DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-client mysql-client

COPY --from=builder /usr/local/cargo/bin/* /usr/local/bin

ENTRYPOINT [ "dbgen" ]