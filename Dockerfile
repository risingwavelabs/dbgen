FROM rust:1.75

COPY . /dbgen
WORKDIR /dbgen

RUN cargo install --path .

ENTRYPOINT ["dbgen"]
CMD ["--help"]
