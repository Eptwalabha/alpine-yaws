FROM alpine:3.4

RUN apk add --no-cache \
        autoconf \
        automake \
        curl \
        erlang \
        erlang-compiler \
        erlang-crypto \
        erlang-dev \
        erlang-erts \
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

RUN curl -sL -O http://yaws.hyber.org/download/yaws-2.0.4.tar.gz && \
    tar -xzf yaws-2.0.4.tar.gz && \
    rm yaws-2.0.4.tar.gz

WORKDIR yaws-2.0.4

RUN autoreconf -fi
RUN ./configure --localstatedir=/var --sysconfdir=/etc
RUN make && make install

CMD ["erl", "-v"]
