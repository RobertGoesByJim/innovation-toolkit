FROM ruby:2.3.0-alpine
MAINTAINER sheaphillips <shea.phillips@gmail.com>

RUN apk update \
  && apk add ruby-dev libpq libgcc ca-certificates make gcc libc-dev libffi-dev \
             nodejs 'python<3' zlib-dev libxml2 libxml2-dev libxslt libxslt-dev \
  && gem install nokogiri -N \
  && gem install jekyll -N \
  && gem install github-pages -N \
  && gem install bundler -N \
  && apk add ruby-json

WORKDIR /toolkit

ADD . /toolkit

RUN adduser -S jekyll

RUN chown -R jekyll:0 /toolkit && chmod -R 770 /toolkit

USER jekyll

EXPOSE 4000

CMD jekyll serve --host 0.0.0.0
