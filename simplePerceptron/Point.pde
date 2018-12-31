class Point {
  float x;
  float y;
  int label;
  
  Point(float x_, float y_) {
    x = x_;
    y = y_;
    
    if(x < y) {
      label = 1;
    } else {
      label = -1;
    }
  }
  
  void show() {
    if(label == 1) {
      fill(0);
    } else {
      fill(255);
    }
    stroke(0);
    ellipse(x, y, 16, 16);
  }
}
