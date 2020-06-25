FROM ruby:2.5.0 as builder

RUN mkdir -pv /opt/app
WORKDIR /opt/app

COPY Gemfile* /opt/app/
RUN /bin/sh -c bundle install
COPY . /opt/app/

CMD [ "tail", "-f", "/dev/null" ]



