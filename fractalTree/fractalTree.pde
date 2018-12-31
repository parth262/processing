float theta = PI/8;

void setup() {
  size(600, 400);
}

void draw() {
  background(255);
  translate(width/2, height);
  branch(100, 2);
}

void branch(float len, float thickness) {
  strokeWeight(thickness);
  line(0,0,0,-len);
  translate(0, -len);
  thickness = thickness*0.88;
  len = len*0.66;
  if(len > 2) {
    pushMatrix();
    rotate(theta);
    branch(len, thickness);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    branch(len, thickness);
    popMatrix();
  }
}
