FROM ruby:2.7.0

RUN useradd -ms /bin/bash  rhsoftware
WORKDIR /rhsoftware

ADD . /rhsoftware

RUN bundle install

RUN chown -R rhsoftware:rhsoftware /rhsoftware
USER rhsoftware

CMD bundle exec rails s -p '3000' -b 0.0.0.0
