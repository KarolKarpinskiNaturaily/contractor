FROM ruby:3.0.0

ENV INSTALL_PATH /app
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g yarn@1
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY . ./
RUN yarn install
ENV BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle
