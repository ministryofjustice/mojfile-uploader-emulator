FROM ruby:2.6.6

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app

ENV PUMA_PORT 8000

RUN touch /etc/inittab

EXPOSE $PUMA_PORT

ENTRYPOINT ["./run.sh"]
