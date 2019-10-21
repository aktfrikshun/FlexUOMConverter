# FlexUOMConverter

The FlexUOMConverter is designed for science teachers who are as comfortable using the command line as they are using a browser.

It provides science teachers the ability to enter the questions and student responses into a computer ( console or web browser ) to be graded.

Conversions supported are as follows:
* temperatures between Kelvin, Celsius, Fahrenheit, and Rankine
* volumes between liters, tablespoons, cubic-inches, cups, cubic-feet, gallons and fingers

__Note:__ All unit of measure conversions are based on the UCUM ( Unified Code for Units of Measure - Units of Measure Org Specification ) at http://unitsofmeasure.org/ucum.html

The FlexUOMConverter application defines a constrained set of conversion units with the flexibility to add any unit from the UMOM specification or define custom units.  A volume unit named "finger" is provided as an example of a custom unit

* Ruby version
  * 2.6.5

* Rails version
  * 5.2.3

* Database
  * SQLLite ( for temporary persistence of a student worksheet with checked answers )

* System dependencies
  * bash shell
  * git ( https://git-scm.com/downloads )
  * docker ( https://hub.docker.com/?overlay=onboarding )

* Build application docker image
  * git clone git@github.com:aktfrikshun/FlexUOMConverter.git
  * cd FlexUOMConverter
  * scripts/build.bash

* How to run the test suite
  * scripts/run-test.bash

* Open bash shell within docker image
  * scripts/run-shell.bash

* Deployment instructions
  * Simply commit to master branch and AWS Code Pipeline will deploy to the ECR instance at http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com

__Usage__

* Run locally
  * scripts/run-local.bash
  * open a webbrowser and enter url http://localhost:3000

* Open rails console & execute a check_answer command
  * scripts/run-console.bash
  * irb> UOMConversion.check_answer('84.2','Fahrenheit','Rankine','543.94')

* curl to AWS public url from command line
  * Index
    * curl -H "accept: application/json" -H "content-type: application/json" http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com
  * Check Answer
    * curl -X POST -H "accept: application/json"  -H "content-type: application/json"   -d '{"student_response": {"resp_input": "85.6","resp_from": "Fahrenheit","resp_to": "Kelvin","resp_answer": "110.7"}}' http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com/create.json
  * Reset Worksheet
    * curl -H "accept: application/json"  -H "content-type: application/json"   http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com/reset.json

* Postman
  * saved entries matching above curl parameters for request, headers & body

__Proposed Enhancements__

* Add Devise gem for user signup and login which provides User and UserSession model classes

* Add model classes and administrative views for:
  * Teacher, a subclass of User, with the ability ( Abilify gem ) to view, create, update, export and print a pdf of student worksheets
  * Student, a subclass of User, with the ability ( Abilify gem ) to view and print a pdf of their own worksheets

* Add an import feature that will allow for bulk importing of a roster of Teachers and Students

* Support https by procuring and installing an SSL Cert into the Elastic Beanstalk env

* Procure and configure a domain name

* Catch and provide nicely formatted pages for standard errors 404, 403, 500, No Route

* Add Alexa skill based on UOMConversion module

* Add mobile app and OCR reader as input for student responses

* As usage volume increases, change the persistance layer to MySQL or Postgres, add in replication, load balancers and regional content delivery

