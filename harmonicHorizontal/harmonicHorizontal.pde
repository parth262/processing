float amp = 300;
float angle = 0.0;

void setup() {
  size(700, 400);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  System.out.println(frameCount);
  float x = amp * sin(angle);
  fill(127);
  stroke(255);
  line(0,0,x,0);
  ellipse(x,0,20,20);
  angle+=0.2;
}
