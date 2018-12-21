float r = 150;
float a = 0.0;
float aV = 0.0;
float aAcc = 0.01;

void setup() {
  size(700, 400);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  float x = r*cos(a);
  float y = r*sin(a);
  stroke(140);
  fill(255);
  line(0,0,x,y);
  ellipse(x, y, 20, 20);
  aV += aAcc;
  float n = noise(a);
  a += n*aV;
  
}
