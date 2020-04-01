# README

Ruby version 2.7.0

for start this app run:

$ docker-compose up dev

is it nesessary to install some dependensies, use:

$ docker-compose run dev bundle install
$ docker-compose run dev bundle update

Afret that, create database:

$ docker-compose run dev rake db: create
$ docker-compose run dev rake db:migrate (if nesessary)

! Important:
In file docker-compose.yml you must set next values:
- TELEGRAM_BOT_TOKEN - your bot token
- HOST - your current host (or ip, like HOST=91.201.224.42 etc)
If you can have dynamic ip, so every time you must set your current router ip and resign webhooks on that ip.
Also chek what in your router(TP-Link...) you have routing from uoter router ports 80, 443
to your comp ports. If not - create it.

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

-----------------
For using bot you must 
1. create self-signed certificates key.pem and cert.pem
it better to create it in terminal or bash. How to do it - find in rake task file.

2. You must sign webhooks using rake:

$ docker-compose run dev rake webhooks:set

3. Check what webhooks successfully installed.

$ docker-compose run dev rake webhooks:info

3.1 If you need you can delete webhooks using rake:

$ docker-compose run dev rake webhooks:delete

4. Start build with rails server and use bot

$ docker-compose up dev
