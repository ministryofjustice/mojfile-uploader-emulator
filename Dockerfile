FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV APP_HOME /usr/src/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install json
RUN bundle install --without development test

ADD . $APP_HOME

RUN touch /etc/inittab

ENTRYPOINT ["./run.sh"]
