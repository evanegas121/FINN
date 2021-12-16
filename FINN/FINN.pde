//http://learningprocessing.com/examples/chp10/example-10-04-timer
//https://exploreembedded.com/wiki/Analog_JoyStick_with_Arduino
import processing.serial.*;
Serial myPort;
PImage sign;
String val;
int xpos = -20;
PImage[] brush = new PImage[5];
PImage[] walk = new PImage[4];
PImage fox;
PImage penguin;
PImage giraffe;
PImage cake;
PImage text;
String [] value;
PImage [] bg =  new PImage[7];
float x,bpm,humidity;
float light;
int counter =  11;
int totalTime = 40000;
int savedTime;

void setup() {
  size(1280, 720);
  bg[0] = loadImage("scene/FinnBedroom.png");
  bg[1] = loadImage("scene/FinnBathroom.png");
  bg[2] = loadImage("scene/FinnGym.png");
  bg[3] = loadImage("scene/Outside.png");
  bg[4] = loadImage("scene/PartyRoom.png");
  bg[5] = loadImage("scene/FinnBedroomNight.png");
  bg[6] = loadImage("scene/OutsideDay.png");
  myPort = new Serial(this,"/dev/tty.usbmodem14101", 9600);
  //myPort = new Serial(this,"/dev/COM7", 9600);
  savedTime = millis();
}

public void draw() { 
  if (counter == 0){ scene0();}
  else if (counter == 1){ scene1();}
  else if (counter == 2){ scene2();}
  else if (counter == 3){ scene3();}
  else if (counter == 4){ scene4();}
  else if (counter == 5){ scene5();}
  else if (counter == 6){ scene6();}
  else if (counter == 7){ scene7();}
  else if (counter == 8){ scene8();}
  else if (counter == 9){ scene9();}
  else if (counter == 10){ scene10();}
  else if (counter == 11){ scene11();}
  else if (counter == 12){ scene12();}
  else if (counter == 13){ scene13();}
  else if (counter == 14){ scene14();}
  else if (counter == 15){ scene15();}
  else if (counter == 16){ scene16();}
}

public void scene0(){
  background(bg[0]);
  fox = loadImage("finn/Finn.png");
  image(fox,100,100);
  text = loadImage("FinneganTitles/Text1.png");
  image(text,10,100);
  if (key == CODED) {
    if (keyCode == RIGHT){
      counter = 9;
    }
    }
}

public void scene9(){
  background(bg[0]);
  fox = loadImage("finn/FinnClothed.png");
  image(fox,100,100);
  text = loadImage("FinneganTitles/Text2.png");
  image(text,10,100);
    if (key == CODED) {
    if (keyCode == UP){
      counter = 1;
    }
    }
}


public void scene1(){
  background(bg[1]);
  fox = loadImage("finn/FinnClothed.png");
  image(fox,100,100); 
  text = loadImage("FinneganTitles/Text3.png");
  image(text,10,100);
  
}

//Good job brushing teeth scene goes here!

//Should we flip scene 1 and scene 2 to match the instructions on canva?
  
public void scene2(){
  background(bg[1]);
  brush[0] = loadImage("finn/FinnClothedBrushTeeth1.png");
  brush[1] = loadImage("finn/FinnClothedBrushTeeth2.png");
  brush[2] = loadImage("finn/FinnClothedBrushTeeth1.png");
  brush[3] = loadImage("finn/FinnClothedBrushTeeth2.png");
  text = loadImage("FinneganTitles/Text4.png");
  image(text,10,100);
  image(brush[frameCount%4],100,100);
  if (key == CODED) {
    if (keyCode == DOWN){
      counter = 8;
    }
    }
}

public void scene8(){ //Finn walking to school
  background(bg[6]);
  walk[0] = loadImage("finn/right1.PNG");
  walk[1] = loadImage("finn/right2.PNG");
  walk[2] = loadImage("finn/right3.PNG");
  walk[3] = loadImage("finn/right1.PNG");
  image(walk[frameCount%4],xpos,50);
  if (xpos <500){xpos = xpos+10;}
  else{
    xpos = 0;
    counter = 3;}
    text = loadImage("FinneganTitles/Text5.png");
  image(text,10,100);
}

public void scene3(){ //Finn gym scene
  background(bg[2]);
  fox = loadImage("finn/FinnGymClothes.png");
  image(fox,x,100);
  text = loadImage("FinneganTitles/Text6.png");
  image(text,10,100);
  int passedTime = millis() - savedTime;
  // Has 20 seconds passed?
  if (passedTime >= totalTime) {
    println("20 seconds have passed!");
    savedTime = millis(); //reset
    counter = 4;
  }
}

//lose scene- reset
public void scene4(){ //Press down to try again
  background(bg[2]);
  fox = loadImage("finn/FinnGymClothes.png");
  sign = loadImage("finn/lose.png");
  image(fox,100,100);
   image(sign,10,100);
   text = loadImage("FinneganTitles/Text7.png");
  image(text,10,100);
    if (keyCode == LEFT){
      counter = 0; //Change this back to 0 
    }
}

public void scene14(){ //Finn gym scene, use joystick to block goal, press up to go to the next scene
  background(bg[2]);
  fox = loadImage("finn/FinnGymClothes.png");
  image(fox,100,100);
  text = loadImage("FinneganTitles/Text8.png");
  image(text,10,100);
  if (key == CODED) {
    if (keyCode == UP){
      counter = 12;
    }
    }
}

public void scene12(){ //Finn jumping jacks scene, get your heartbeat up to get to the next scene
  background(bg[2]);
  brush[0] = loadImage("finn/FinnGymClothes.png");
  brush[1] = loadImage("finn/FinnGymJump.png");
  brush[2] = loadImage("finn/FinnGymClothes.png");
  brush[3] = loadImage("finn/FinnGymJump.png");
  brush[4] = loadImage("finn/FinnGymJump.png");
  text = loadImage("FinneganTitles/Text9.png");
  image(text,10,100);
  image(brush[frameCount%4],100,100);
}
 

public void scene5(){ //Finn walking to the party
  background(bg[6]);
  walk[0] = loadImage("finn/right1.PNG");
  walk[1] = loadImage("finn/right2.PNG");
  walk[2] = loadImage("finn/right3.PNG");
  walk[3] = loadImage("finn/right1.PNG");
  image(walk[frameCount%4],xpos,50);
  if (xpos <500){xpos = xpos+10;}
  else{
    xpos = 0;
    counter = 6;}
  text = loadImage("FinneganTitles/Text11.png");
  image(text,10,100);
}

public void scene6(){ //Finn and friends before blowing out the candle, blow on the blue box
  background(bg[4]);
  fox = loadImage("finn/FinnClothedBirthday.png");
  penguin = loadImage("finn/Penny.png");
  giraffe = loadImage("finn/George3.png");
  cake = loadImage("finn/CakeLit.png");
  image(fox,300,0,850,600);
  image(cake,100,100);
  image(penguin,230,150);
  image(giraffe,100,100);
  if (key == CODED) {
    if (keyCode == LEFT){
      counter = 11;
    }
    }
    text = loadImage("FinneganTitles/Text12.png");
  image(text,10,100);
}

public void scene11(){ //Good lungs you blew away the table, press the up button to continue to the next scene
  background(bg[4]);
  fox = loadImage("finn/FinnClothedBirthdayCandles.png");
  penguin = loadImage("finn/Pennyblow.png");
  giraffe = loadImage("finn/George3.png");
  cake = loadImage("finn/CakeUnlit.png");
  image(fox,300,0,800,600);
  image(cake,100,100);
  image(penguin,230,150);
  image(giraffe,100,100);
  if (key == CODED) {
    if (keyCode == UP){
      counter = 10;
    }
    }
  text = loadImage("FinneganTitles/Text13.png");
  image(text,10,100);
}

public void scene10(){ //Finn walking home from the party
  background(bg[3]);
  walk[0] = loadImage("finn/FinnWalkParty1.png");
  walk[1] = loadImage("finn/FinnWalkParty2.png");
  walk[2] = loadImage("finn/FinnWalkParty3.png");
  walk[3] = loadImage("finn/FinnWalkParty1.png");
  image(walk[frameCount%4],xpos,50);
  if (xpos > - 500){xpos = xpos-10;}
  else{
    xpos = 0;
    counter = 13;}
   text = loadImage("FinneganTitles/Text14.png");
  image(text,10,100);
}

public void scene13(){ //Finn before he gets changed for bed, press button to get dressed
  background(bg[5]);
  fox = loadImage("finn/Finn.png"); 
  image(fox,100,100);
  text = loadImage("FinneganTitles/Text15.png");
  image(text,10,100);
   //if (key == CODED) {
   //   if (keyCode == RIGHT){
   //     counter = 7;
   //   }
   // }
}

public void scene7(){ 
  background(bg[5]);
  fox = loadImage("finn/FinnPajamas.png");
   image(fox,100,100); 
   text = loadImage("FinneganTitles/Text16.png");
  image(text,10,100);
  
}

public void scene15(){ //gif scene goes here
  background(bg[5]);
  fox = loadImage("finn/FinnPajamas.png");
   image(fox,100,100);  
   text = loadImage("FinneganTitles/Text17.png");
  image(text,10,100);
  
}

public void scene16(){ 
  background(bg[7]);
  
}
  
void serialEvent(Serial p) {
     String inString = p.readStringUntil('\n'); // read in the string
     if(inString!=null){
      inString = trim(inString);  // remove any whitespace
      value = split(inString, "&");
       //bpm = float(value[3]);
      //println(value[3]);
   if (counter == 1 ){
      // if the button is pressed, it sends a "0"
      if (value[0].equals("0") ) {
        counter = 2;
      }
    }
    if (counter == 13 ){
      // if the button is pressed, it sends a "0"
      if (value[0].equals("0") ) {
        counter = 7;
      }
    }
    if (counter == 3 ){
      x = float(value[1]);
      println(x);
      if ((87) >= x ) {
        counter = 14;
      }
    }
  if (counter == 12){
     bpm = float(value[2]);
      println(bpm);
      if (bpm >= 127 ) {
        counter = 5;
      }
    } 
    if (counter == 6 ){
      humidity = float(value[3]);
      println(humidity);
      if ( humidity > 30 ) {
        counter =11 ;
      }
    }
     if (counter == 7 ){
      light = float(value[4]);
      println(light);
      if ((300) >= light ) {
        counter = 15;
      }
    }
 }
}
