PImage fox;
PImage [] bg =  new PImage[5];
int counter = 0;
void setup() {
  size(1280, 720);
  bg[0] = loadImage("example.jpg");
  bg[1] = loadImage("Image.jpg");
  
}

public void draw() { 
  if (counter == 0){ scene0();}
  else if (counter == 1){ scene1();}
  else if (counter == 2){ scene2();}
  else if (counter == 3){ scene3();}
}

public void scene0(){
  background(bg[0]);
  fox = loadImage("fox.png");
  image(fox,100,100);
  if (key == CODED) {
    if (keyCode == RIGHT){
      counter = 2;
    }
    }
}

public void scene1(){
  background(bg[1]);
  fox = loadImage("Moon.png");
  image(fox,100,100);
  if (key == CODED) {
    if (keyCode == RIGHT){
      scene3();
    }
  }
}
  
  
public void scene2(){
  background(bg[1]);
  fox = loadImage("fox.png");
  image(fox,100,100);
  if (key == CODED ) {
    if (keyCode == LEFT){
      counter = 1;
    }
  }
}

public void scene3(){
  background(bg[1]);
  fox = loadImage("fox.png");
  image(fox,100,100);
   if (key == CODED ) {
  if (keyCode == LEFT){
    counter = 2;
  }
}
}
