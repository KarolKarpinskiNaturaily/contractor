# README

To run the app:

* docker network create communication_network
* docker-compose run --rm web bundle install
* docker-compose build
* docker-compose run --rm web bin/rails db:create bin/rails db:migrate
* docker-compose up

Visit localhost:3000
