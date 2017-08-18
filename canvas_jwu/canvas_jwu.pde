// jacqswu 

import controlP5.*;
ControlP5 cp5;

Textlabel title;
Textlabel titleP;

int gridW = 1000;

int num=400;
int spacing = 200;

int controlX = 1075;
int py = 270;

Grid grid1;
Check[] boxes;

boolean showGrid;
boolean toggleGrid;

int iteration;

void setup() {
  size(1675, 1000); 
  background(255);
  smooth();
  iteration = 1;
  
  cp5 = new ControlP5(this);
  title = cp5.addTextlabel("title")
        .setText("CONTROLS")
        .setPosition(controlX,50)
        .setColorValue(0)
        ;
       
  cp5.addToggle("toggleGrid")
       .setPosition(controlX, 100)
       .setSize(50,10)
       .setColorLabel(0)
       .setLabel("toggle grid")
       .setValue(true)
       .setMode(ControlP5.SWITCH)
       ;
       
  cp5.addBang("shuffle")
       .setPosition(controlX, 150)
       .setSize(50, 10)
       .setColorLabel(0)
       .setLabel("shuffle")
       ;
       
  cp5.addBang("reset")
       .setPosition(controlX, 200)
       .setSize(50, 10)
       .setColorLabel(0)
       .setLabel("reset")
       ;
       
  titleP = cp5.addTextlabel("titleP")
      .setText("PALETTE")
      .setPosition(controlX,250)
      .setColorValue(0)
      ;
       
  cp5.addButton("forest")
     .setValue(0)
     .setPosition(controlX,py)
     .setSize(50,14)
     ;
     
  cp5.addButton("ocean")
     .setValue(1)
     .setPosition(controlX,py+15)
     .setSize(50,14)
     ;
     
  cp5.addButton("dawn")
     .setValue(2)
     .setPosition(controlX,py+15*2)
     .setSize(50,14)
     ;
     
  cp5.addButton("sunset")
     .setValue(3)
     .setPosition(controlX,py+15*3)
     .setSize(50,14)
     ;
     
  cp5.addButton("black")
     .setValue(10)
     .setPosition(controlX,py+15*4)
     .setSize(50,14)
     ;
     
     
       
  cp5.addBang("saveImg")
     .setPosition(controlX, 400)
     .setSize(50, 10)
     .setColorLabel(0)
     .setLabel("save")
     ;
  
  grid1 = new Grid(spacing);
  
  boxes= new Check[num];
  int xPos=0;
  int yPos=0;
  
  // Inputs: x, y, size, fill color
  for(int q=0; q<boxes.length; q++){
    
    boxes[q]= new Check(xPos, yPos, spacing, color(0));
    
    xPos += spacing;
    
    if(xPos>=gridW){
      xPos=0;
      yPos +=spacing;
    }
    
    boxes[q].shuffle();
    
    println(boxes[q].x + "," + boxes[q].y);
  }
}

void draw() {
  fill(255);
  noStroke();
  rect(0, 0, gridW, height);
  
  if(showGrid == true){
    grid1.display();
  }
  
  for(int j=0; j<boxes.length; j++){
    boxes[j].display();
  }
}

void mousePressed() {
  for(int i=0; i<boxes.length; i++){
      boxes[i].press(mouseX, mouseY);
  }
}

void keyPressed(){
  if(key == ' '){
    for(int i=0; i<boxes.length; i++){
      boxes[i].shuffle();
    }
  }
  
  if(key == 'g'){
    showGrid = !showGrid;
  }
  
  if(key == 'r'){    //reset
    for(int i=0; i<boxes.length; i++){
      boxes[i].checked = false;
    }
  }
  
  if(key == 's'){
    println("Saving...iteration-"+iteration+".jpg");
    save("iteration-"+iteration+".jpg");
    println("Done saving.");
    iteration++;
  }
}

public void shuffle() {
  for(int i=0; i<boxes.length; i++){
      boxes[i].shuffle();
    }
}

public void reset() {
  for(int i=0; i<boxes.length; i++){
      boxes[i].checked = false;
    }
}

public void saveImg() {
  println("Saving...iteration-"+iteration+".jpg");
  save("iteration-"+iteration+".jpg");
  println("Done saving.");
  iteration++;
}

void toggleGrid(boolean theFlag) {
  if(theFlag==true) {
    showGrid=true;
  } else {
    showGrid=false;
  }
  //println("a toggle event.");
}

public void forest(int theValue) {
  println("a button event from forest: "+theValue);
  for(int i=0; i<boxes.length; i++){
      boxes[i].changePalette(theValue);
    }
}

public void ocean(int theValue) {
  println("a button event from ocean: "+theValue);
  for(int i=0; i<boxes.length; i++){
      boxes[i].changePalette(theValue);
    }
}

public void dawn(int theValue) {
  println("a button event from dawn: "+theValue);
  for(int i=0; i<boxes.length; i++){
      boxes[i].changePalette(theValue);
    }
}

public void sunset(int theValue) {
  println("a button event from sunset: "+theValue);
  for(int i=0; i<boxes.length; i++){
      boxes[i].changePalette(theValue);
    }
}

public void black(int theValue) {
  println("a button event from black: "+theValue);
  for(int i=0; i<boxes.length; i++){
      boxes[i].changePalette(theValue);
    }
}