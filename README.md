# FlexUOMConverter

The FlexUOMConverter is designed to allow research blah, blah, blah

It defines a constrained set of conversion unit with the flexibility to add any unit from the UMOM specification or define custom units.


* Ruby version
  * 2.6.5
  
* Database
  * SQLLite ( for temporary persistence of a student worksheet with checked answers )

* System dependencies
  * Docker ( to run in development mode )
  
* Build docker image
  * clone repo and cd into FlexUOMConverter folder
  * docker build . -t flexconv:v1.0  

* How to run the test suite
  * docker run -i -t flexconv:v1.0 rspec

* Deployment instructions
  * Simply commit to master branch and AWS Code Pipeline will deploy to the ECR instance
  
* Run locally
  * docker run -i -t -p 3000:3000 -v /srv/FlexUOMConverter:/FlexUOMConverter flexconv:v1.0 rails s -b 0.0.0.0
  * open browser to http://localhost:3000

* Open rails console
  * docker run -i -t -v /srv/FlexUOMConverter:/FlexUOMConverter flexconv:v1.0 rails c
  * irb> require 'uom_conversion'
  * irb> UOMConversion.check_answer('84.2','Fahrenheit','Rankine','543.94')

* Run bash withun Docker image
  * docker run -i -t -v /srv/FlexUOMConverter:/FlexUOMConverter flexconv:v1.0 bash

* curl to AWS public url from command line
  * Index 
    * curl -H "accept: application/json" -H "content-type: application/json" http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com
  * Check Answer 
    * curl -X POST -H "accept: application/json"  -H "content-type: application/json"   -d '{"student_response": {"resp_input": "85.6","resp_from": "Fahrenheit","resp_to": "Kelvin","resp_answer": "110.7"}}' http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com/create.json
  * Reset Worksheet 
    * curl -H "accept: application/json"  -H "content-type: application/json"   http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com/reset.json

