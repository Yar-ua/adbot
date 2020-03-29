FROM ruby:2.7.0

ENV APP_NAME adbot

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y postgresql-client tzdata


# https://yarnpkg.com/lang/en/docs/install/#debian-stable
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y nodejs postgresql-client vim && \
  apt-get install -y yarn && \
  apt-get install -y imagemagick && \
  apt-get install -y libvips-tools && \
  apt-get install -y locales



RUN mkdir /adbot
WORKDIR /adbot

ADD Gemfile /adbot/Gemfile
ADD Gemfile.lock /adbot/Gemfile.lock
RUN bundle install
ADD . /adbot

RUN gem update --system

EXPOSE 3000
