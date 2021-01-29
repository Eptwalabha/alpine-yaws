FROM alpine:3.11

RUN apk add --no-cache \
        autoconf \
        automake \
        curl \
        erlang \
        erlang-compiler \
        erlang-crypto \
        erlang-dev \
        erlang-erts \
        erlang-eunit \
        erlang-inets \
        erlang-public-key \
        erlang-sasl \
        erlang-ssl \
        erlang-xmerl \
        g++ \
        gawk \
        gcc \
        libtool \
        linux-pam-dev \
        make \
        openssl

# yaws 2.0.8
WORKDIR /
RUN curl -sL -O https://github.com/erlyaws/yaws/archive/yaws-2.0.8.tar.gz && \
    tar -xzf yaws-2.0.8.tar.gz && \
    rm yaws-2.0.8.tar.gz && \
    mv yaws-yaws-2.0.8 yaws-2.0.8

WORKDIR yaws-2.0.8

RUN autoreconf -fi
RUN ./configure --localstatedir=/var --sysconfdir=/etc
RUN make install

CMD ["erl", "-v"]
