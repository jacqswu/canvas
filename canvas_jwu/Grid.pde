class Grid {
  int size;                 // Dimension (width and height) 

  Grid(int s) {
    size = s;
  }
  
  // Draws the box and an arc inside if the checked variable is true
  void display() {
    stroke(0, 20);
    for (int i = 0; i <= gridW; i+=size) {
      line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=size) {
      line (0, i, gridW, i);
    }
  }
}