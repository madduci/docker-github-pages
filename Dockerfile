FROM alpine:latest

LABEL maintainer="Michele Adduci <adduci.michele@gmail.com>"

VOLUME /site

EXPOSE 4000

WORKDIR /site

RUN apk update && \
    apk --update add \
    gcc \
    g++ \
    make \
    curl \
    bison \
    ca-certificates \
    tzdata \
    ruby \
    ruby-rdoc \
    ruby-irb \
    ruby-bundler \
    ruby-dev \
    glib-dev \
    libc-dev && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install --no-ri --no-rdoc github-pages --version 202 && \
    gem install --no-ri --no-rdoc jekyll-watch && \
    gem install --no-ri --no-rdoc jekyll-admin && \
    apk del gcc g++ binutils bison perl nodejs make curl && \
    rm -rf /var/cache/apk/*

CMD ["exec", "jekyll"]
ENTRYPOINT ["bundle"]
