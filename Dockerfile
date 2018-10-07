FROM project/currency_exchange

COPY . /usr/src/app

RUN gem install bundler
RUN bundle install

