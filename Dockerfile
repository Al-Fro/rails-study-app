FROM ruby:2.7.1-alpine

ARG RAILS_ROOT=/app
ARG PACKAGES="openssl-dev postgresql-dev build-base curl build-essential nodejs yarn git less tzdata bash"

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES \
    && rm -rf /var/lib/apt/lists/* \
    && curl -o- -L https://yarnpkg.com/install.sh | bash

RUN gem install bundler:2.1.4

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock  ./
RUN bundle install --jobs 5

COPY package.json yarn.lock ./
RUN yarn install

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
