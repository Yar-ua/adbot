# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Ruby version 2.7.0

- for start this app run:

$ docker-compose up dev

- in it nesessary to install some dependensies, use:

$ docker-compose run dev bundle install
$ docker-compose run dev bundle update

Afret that, create database:

$ docker-compose run dev rake db: create
$ docker-compose run dev rake db:migrate (if nesessary)


You can find rails app server on localhost:3000

You can find pgadmin on localhost:4001
For connection to pgadmin use next settings (also you can set it in docker-compose.yml file):
login: test@1.com
password: 123

In pgadmin for connect to DB create server and use next settings:
- host name/adress: db
- port: 5432 (according docker-compose settings)
- maintenance database: postgres
- password: /.. empty field ../


Bot register info:
bot name: adbot
bot username: adbot25_bot