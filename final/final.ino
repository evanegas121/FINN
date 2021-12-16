// variables for pins
int buttonPin = 2;
String delimiter = "& ";
int incomingData;

#define joyX A0
#define joyY A1
int xValue,yValue;

#define USE_ARDUINO_INTERRUPTS true    // Set-up low-level interrupts for most acurate BPM math.
#include <PulseSensorPlayground.h>    // Includes the PulseSensorPlayground Library.
const int PulseWire = 3;       // PulseSensor PURPLE WIRE connected to ANALOG PIN 0
int Threshold = 550;           // Determine which Signal to "count as a beat" and which to ignore.
PulseSensorPlayground pulseSensor;  // Creates an instance of the PulseSensorPlayground object called "pulseSensor"

#include "DHT.h"
#define DHTPIN 6     // Digital pin connected to the DHT sensor
#define DHTTYPE DHT11 
DHT dht(DHTPIN, DHTTYPE);

void setup() {
  // turn on internal pull-up resistor
  pinMode( buttonPin, INPUT_PULLUP );
  // start Serial
  Serial.begin( 9600 );
  dht.begin();
  pulseSensor.analogInput(PulseWire);   
  pulseSensor.setThreshold(Threshold);
  pulseSensor.begin();
}

void loop() {
  // read in value
    //read connected sensors
  xValue = analogRead(joyX);
  yValue = analogRead(joyY);
  int buttonValue = digitalRead(buttonPin);
  int myBPM = pulseSensor.getBeatsPerMinute();
  int value = analogRead(A5);
  float h = dht.readHumidity();
    

  //concatenate sensors with delimiter between (this ampersand will allow p5 to split the two values apart
 Serial.println((buttonValue)+delimiter+xValue+delimiter+myBPM+delimiter+(h)+delimiter+value);
//  check to see if there is a connection 
  if(Serial.available() > 0){ // Checks whether data is comming from the serial port
    //if so, read the incoming data
    incomingData = Serial.read(); // Reads the data from the serial port
 }


// wait a little bit
delay( 100 );
}
