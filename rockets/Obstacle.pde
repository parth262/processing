class Obstacle {

  PVector location;
  int w, h;

  Obstacle(int x, int y, int w, int h) {
    location = new PVector(x, y);
    this.w = w;
    this.h = h;
  }
  
  void display() {
    fill(150);
    pushMatrix();
    rectMode(CORNER);
    rect(location.x, location.y, w, h);
    popMatrix();
  }
  
  boolean contains(PVector l) {
    return l.x >= location.x && l.x <= location.x + w && l.y >= location.y && l.y <= location.y+h;
  }
}
