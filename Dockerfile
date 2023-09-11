FROM ruby:alpine

ARG BUNDLER_VERSION=2.4.18
ARG RAILS_ENV=development

ENV LANG=C.UTF-8 \
  BUNDLE_BIN=/usr/local/bundle/gems/bin \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=/usr/local/bundle/gems \
  BUNDLE_RETRY=3 \
  GEM_HOME=/usr/local/bundle/gems

ENV PATH=$PATH:$BUNDLE_BIN

RUN gem update --system \
  && gem install bundler:$BUNDLER_VERSION
RUN echo "America/Sao_Paulo" > /etc/timezone 

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY . .

RUN bundle install --binstubs --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

CMD puma -C config/puma.rb
