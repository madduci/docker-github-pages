# docker-github-pages

[![Build Status](https://travis-ci.org/madduci/docker-github-pages.svg?branch=master)](https://travis-ci.org/madduci/docker-github-pages)

GitHub-Pages Docker container, powered by Alpine Linux and Jekyll installed via the [github-pages gem](https://github.com/github/pages-gem).

To run this image (and to build your pages), you can simply run:

`docker run --rm -it -p 4000:4000 -v /mysite:/site madduci/docker-github-pages install && exec jekyll serve --watch --force_polling --host 0.0.0.0`

Beware as entrypoint the application *bundle* is exposed

### Warning

By default, Jekyll will run on 127.0.0.1 (default gem configuration): this will make jekyll unreachable from outside the docker container. 

To override this behaviour, just give the extra `--host X.X.X.X` parameter to serve the specific IP.

### BEWARE

Due to recent updates to `github-pages` ruby gem, you need to delete your previous **Gemfile.lock** and let jekyll regenerate it, or it will end up in an error, adding explicitly the `jekyll-watch` and (if desired) the `jekyll-admin` dependencies.

In addition, you now need to run jekyll behind `bundle`, installing the required rubygems and launching the generation process.

The best solution is to derive this image and modify the build steps according to your requirements.