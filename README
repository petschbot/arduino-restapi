# Arduino REST-API via Ruby

A simple combination of Ruby, utilizing the serialport and rest-client gems, and Arduino processing for:

* Arduino event driven REST API Calls
* Bidirectional communication between a local Ruby script and an Arduino.

## Workflow

* If the Arduino detects an button push event, it will send an predefined character to the serial port.
* The ruby script monitors the serial port and the defined character triggers an API call.
* Depending on the response code of the API call, the ruby script sends a "1" (status code 200) or a "0" to the serial port.
* The Arduino monitors the serial port, too. It will turn on a specific led, depending on the received character.

## Files
* arduino-restapi.rb (the Ruby script)
* arduino-restapi.ino (the Arduino processing script)
* config.yaml (an example restclient configuration)

## Usage

The api call URL and request body is outsourced to the yaml file (so you can use several API webservices in combination with the ruby script).

ruby arduino-restapi.rb config.yaml /dev/tty.yourarduinousbmodemport



