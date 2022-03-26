FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y yarn
RUN curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
RUN mkdir /myapp
WORKDIR /myapp
RUN gem install bundler:2.2.3
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
