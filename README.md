# FlexUOMConverter

The FlexUOMConverter is designed for science teachers who are as comfortable using the command line as they are using a browser.

It provides science teachers the ability to enter the questions and student responses into a computer ( console or web browser ) to be graded.

Conversions supported are as follows:
* temperatures between Kelvin, Celsius, Fahrenheit, and Rankine
* volumes between liters, tablespoons, cubic-inches, cups, cubic-feet, gallons and fingers

__Note:__ All unit of measure conversions are based on the UCUM ( Unified Code for Units of Measure - Units of Measure Org Specification ) at http://unitsofmeasure.org/ucum.html

The FlexUOMConverter application defines a constrained set of conversion units with the flexibility to add any unit from the UMOM specification or define custom units.  A volume unit named "finger" is provided as an example of a custome unit

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

* Run locally
  * scripts/run-local.bash

* Open rails console & execute a check_answer command
  * scripts/run-console.bash
  * irb> UOMConversion.check_answer('84.2','Fahrenheit','Rankine','543.94')

* Open bash shell within docker image
  * scripts/run-shell.bash

* Deployment instructions
  * Simply commit to master branch and AWS Code Pipeline will deploy to the ECR instance at http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com

* curl to AWS public url from command line
  * Index
    * curl -H "accept: application/json" -H "content-type: application/json" http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com
  * Check Answer
    * curl -X POST -H "accept: application/json"  -H "content-type: application/json"   -d '{"student_response": {"resp_input": "85.6","resp_from": "Fahrenheit","resp_to": "Kelvin","resp_answer": "110.7"}}' http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com/create.json
  * Reset Worksheet
    * curl -H "accept: application/json"  -H "content-type: application/json"   http://rubysample-env.4ngcymdfpz.us-east-1.elasticbeanstalk.com/reset.json

