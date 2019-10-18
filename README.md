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

* Docker commands
** Build docker image
** docker build . -t flexconv:v1.0

** Run in development
** docker run -i -t -p 3000:3000 -v /srv/FlexUOMConverter:/FlexUOMConverter flexconv:v1.0 rails s -b 0.0.0.0

** Run console
** docker run -i -t -v /srv/FlexUOMConverter:/FlexUOMConverter flexconv:v1.0 rails c

** Run Tests
** docker run -i -t flexconv:v1.0 rspec

** Run bash
** docker run -i -t flexconv:v1.0 bash
