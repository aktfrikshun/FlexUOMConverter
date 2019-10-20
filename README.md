# FlexUOMConverter

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * 2.6.5

* System dependencies
  * Docker ( to run in development mode )

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Docker commands
** Build docker image
** docker build . -t flexconv:v1.0

** Run in local webrowser
** docker run -i -t -p 3000:3000 -v /srv/FlexUOMConverter:/FlexUOMConverter flexconv:v1.0 rails s -b 0.0.0.0

** Run in console
** docker run -i -t -v /srv/FlexUOMConverter:/FlexUOMConverter flexconv:v1.0 rails c
irb> require 'uom_conversion'
irb> UOMConversion.check_answer(84.2,'degree Fahrenheit','degree Rankine',543.94)

** Run Tests
** docker run -i -t flexconv:v1.0 rspec

** Run bash
** docker run -i -t -v /srv/FlexUOMConverter:/FlexUOMConverter flexconv:v1.0 bash

** curl

** AWS public url
** Index curl -H "accept: application/json" -H "content-type: application/json" http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com
** Check Answer curl -X POST -H "accept: application/json"  -H "content-type: application/json"   -d '{"student_response": {"resp_input": "85.6","resp_from": "Fahrenheit","resp_to": "Kelvin","resp_answer": "110.7"}}' http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com/create.json
** Reset Worksheet curl -H "accept: application/json"  -H "content-type: application/json"   http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com/reset.json

