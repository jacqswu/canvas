class Check {
  int x, y;                 // The x- and y-coordinates 
  int size;                 // Dimension (width and height) 
  color baseGray;           // Default gray value
  boolean checked = false;  // True when the check box is selected 
  int z;                    // State of visual
  int p;

  color c1 = 0;
  color c2 = 0;
  color c3 = 0;
  color c4 = 0;
  color c5 = 0;

  Check(int xp, int yp, int s, color b) {
    x = xp;
    y = yp;
    size = s;
    baseGray = b;
    
  }

  // Updates the boolean variable checked
  void press(float mx, float my) {
    if ((mx >= x) && (mx <= x+size) && (my >= y) && (my <= y+size)) {
      checked = !checked;  // Toggle the check box on and off
    }
  }
  
  void shuffle(){
    z = int(random(4));    //quarter circle positions
    p = int(random(9));    //color palette ratios
  }
  
  void changePalette(int palette){
    if(palette == 0){    //forest
      c1 = color(192, 216, 120);
      c2 = color(168, 191, 96);
      c3 = color(90, 112, 64);
      c4 = color(37, 77, 51);
      c5 = color(8, 33, 24);
    }
    
    if(palette == 1){    //ocean
      c1 = color(18, 249, 255);
      c2 = color(0, 180, 252);
      c3 = color(0, 91, 196);
      c4 = color(1, 38, 118);
      c5 = color(0, 20, 73);
    }
    
    if(palette == 2){    //dawn
      c1 = color(254, 254, 203);
      c2 = color(248, 229, 198);
      c3 = color(238, 207, 196);
      c4 = color(226, 194, 197);
      c5 = color(210, 198, 204);
    }
    
    if(palette == 3){    //sunset
      c1 = color(165, 2, 108);
      c2 = color(209, 2, 77);
      c3 = color(252, 56, 2);
      c4 = color(251, 127, 3);
      c5 = color(255, 170, 5);
    }
    
    if(palette == 10){    //black
      c1 = c2 = c3 = c4 = c5 = color(0);
    }
  }
  
  //void drawGrid(){
  //  stroke(0, 20);
  //  noFill();
  //  //fill(baseGray);
  //  rect(x, y, size, size);
  //}

  // Draws the box and an arc inside if the checked variable is true
  void display() {
    stroke(0, 20);
    //fill(baseGray);
    //noFill();
    //rect(x, y, size, size);
  
    int ss = size*2;
    
    if (checked == true) {
      noStroke();
      
    //COLOR 
      if(p == 8){
        fill(color(c1));
      }
      if(p < 8 && p >= 6){
        fill(color(c2));
      }
      if(p < 6 && p >= 3){
        fill(color(c3));
      }
      if(p < 3 && p >= 1){
        fill(color(c4));
      }
      if(p == 0){
        fill(color(c5));
      }
      
    //SHAPE ROTATIONS
      if(z == 0){
        arc(x, y, ss, ss, 0, HALF_PI);
      }
      if(z == 1){
        arc(x+size, y, ss, ss, HALF_PI, PI);
      }
      if(z == 2){
        arc(x+size, y+size, ss, ss, PI, 3*HALF_PI);
      }
      if(z == 3){
        arc(x, y+size, ss, ss, 3*HALF_PI, TWO_PI);
      }
    }
  }
}