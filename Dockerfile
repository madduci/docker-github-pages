FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4

LABEL maintainer="Michele Adduci <michele@adduci.org>"

VOLUME /site

EXPOSE 4000

WORKDIR /site

RUN apk update && \
    apk --update add \
    gcc \
    g++ \
    make \
    git \
    curl \
    bison \
    ca-certificates \
    tzdata \
    ruby \
    ruby-rdoc \
    ruby-bundler \
    ruby-nokogiri \
    ruby-dev \
    glib-dev \
    zlib-dev \
    libc-dev && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install github-pages --version 232 && \
    gem install jekyll-watch && \
    gem install jekyll-admin && \
    rm -rf /var/cache/apk/*

CMD ["exec", "jekyll"]
ENTRYPOINT ["bundle"]
