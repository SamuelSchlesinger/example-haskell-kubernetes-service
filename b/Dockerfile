FROM haskell:8.8.3-buster

WORKDIR /opt/service

RUN cabal update

COPY ./service-b.cabal /opt/service/service-b.cabal
RUN cabal build --only-dependencies -j4

COPY . /opt/service
RUN cabal install

CMD ["service-b"]
