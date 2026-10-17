FROM alpine:3.24.2@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

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
    gem install jekyll --version 4.4.1 && \
    gem install jekyll-coffeescript && \
    gem install jekyll-default-layout && \
    gem install jekyll-gist && \
    gem install jekyll-github-metadata && \
    gem install jekyll-optional-front-matter && \
    gem install jekyll-paginate && \
    gem install jekyll-readme-index && \
    gem install jekyll-titles-from-headings && \
    gem install jekyll-relative-links && \
    gem install jekyll-watch && \
    gem install jekyll-admin && \
    rm -rf /var/cache/apk/*

CMD ["exec", "jekyll"]
ENTRYPOINT ["bundle"]
