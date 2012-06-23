# This script combines the serialport gem with the rest-client gem
# purpose: trigger a REST-API-Call by a serial signal generated by a Arduino
# V1.1 Update: Alternative Exception handling


require "rubygems"
require "serialport"
require 'rest-client'
require 'yaml'


# reading the config yaml
config_file = ARGV[0] # first command line argument, e.g. config.yml
raw_config = File.read(config_file)
app_config = YAML.load(raw_config)


# params for serial port
port_str = ARGV[1] # second command line argument, e.g. /dev/tty.usbmodem411
baud_rate = 9600
data_bits = 8
stop_bits = 1

parity = SerialPort::NONE

# init serial port
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)


# params for rest client
url = app_config[:restclient][:url]
request_body = app_config[:restclient][:request_body]

sleep 10
puts "Ready!"

while true do
  
  sp_string = sp.gets
  
  # If the arduino send an "a" via the serial port start the REST Call
  if sp_string.to_s =~ /a/ then

      response = RestClient.post(url, request_body, :content_type => 'application/xml', :accept => 'application/xml'){|response, request, result| response }
      puts response

      # if the REST Call was sucessfull ACK by the server send a "1" to the Arduino
      if response.code == 200 then
        sp.write "1"
      else
        sp.write "0"
      end

  end
end

sp.close
