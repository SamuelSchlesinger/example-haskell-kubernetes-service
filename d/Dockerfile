FROM rust:1.43-buster

WORKDIR /opt/service

COPY . .

RUN cargo install --path .

ENTRYPOINT ["d"]
