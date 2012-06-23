// Initalize variables

int led_red = 12;
int led_green = 10;
int button = 8;


void setup() {                
  // initialize the digital pins as output and input.
  pinMode(led_red, OUTPUT);
  pinMode(led_green, OUTPUT);
  pinMode(button, INPUT);
  
  // initialize the serial port
  Serial.begin(9600);  
}

// the loop routine runs over and over again forever:
void loop() {
  
  // turn booth leds off
  digitalWrite(led_red, LOW);
  digitalWrite(led_green, LOW);
    

  // if button is pushed send an a and wait two sec
  // so the button can be raised again
  if (digitalRead(button) == HIGH) {     
    Serial.print("a");
    delay(2000);
  }
 
  // if an "0" is received turn on the red led for 5 seconds
  if (Serial.read() == 48) {
    digitalWrite(led_red, HIGH);
    delay(5000);
  }
  
  // if an "1" is received turn on the green led for 5 seconds
  if (Serial.read() == 49) {
    digitalWrite(led_green, HIGH);
    delay(5000);
  }


}
