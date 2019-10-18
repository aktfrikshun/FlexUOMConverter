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
** docker build . -t flexconv:v1.0
** docker run -i -t -p 3000:3000 flexconv:v1.0 rails s -b 0.0.0.0
** docker run -i -t flexconv:v1.0 EDITOR="vi --wait" rails credentials:edit
** docker run -i -t flexconv:v1.0 rails c
