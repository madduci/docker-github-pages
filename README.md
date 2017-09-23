# docker-github-pages

[![Build Status](https://travis-ci.org/madduci/docker-github-pages.svg?branch=master)](https://travis-ci.org/madduci/docker-github-pages)

GitHub-Pages Docker container, powered by Alpine Linux and Jekyll installed via the [github-pages gem](https://github.com/github/pages-gem).

Based on [andredumas/github-pages](https://github.com/andredumas/docker-github-pages) project, optimized to fetch latest packages and make it lighter

To run this image (and to build your pages), you can simply run:

`docker run --rm -it -p 4000:4000 -v /mysite:/site madduci/docker-github-pages serve --watch --force_polling --host 0.0.0.0`

Beware as entrypoint the application *jekyll* is exposed

### Warning

By default, Jekyll will run on 127.0.0.1 (default gem configuration): this will make jekyll unreachable from outside the docker container. 

To override this behaviour, just give the extra `--host X.X.X.X` parameter to serve the specific IP.

### BEWARE

Due to recent updates to `github-pages` ruby gem, you need to delete your previous **Gemfile.lock** and let jekyll regenerate it, or it will end up in an error
