FROM ruby:2-alpine
COPY callbacks.ru ./callbacks.ru
RUN gem install rakeup

CMD ["rackup", "-p", "9292", "-E", "development", "-o", "0.0.0.0", "-s", "webrick", "./callbacks.ru"]
