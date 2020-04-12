FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

ENV LANG C.UTF-8

RUN mkdir /app
WORKDIR /app

RUN gem install bundler -v 2.0.2

COPY Gemfile Gemfile.lock ./


ENV RAILS_SERVE_STATIC_FILES=enabled \
  BUNDLE_JOBS=4 \
  RAILS_LOG_TO_STDOUT=enabled

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]