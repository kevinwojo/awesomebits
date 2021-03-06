FROM ruby:2.1.7

RUN apt-get update -qq \
  && apt-get install -y build-essential libpq-dev libqtwebkit-dev qt4-qmake nodejs

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app

CMD ["/app/docker-runapp.sh"]
