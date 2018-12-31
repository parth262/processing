float angle = 0.0;
float aV = 0.23;

void setup() {
  size(700, 400);
}

void draw() {
  background(0);
  angle += 0.015;
  float a = angle;
  for(int x=0;x<width;x+=20) {
    float y = map(sin(a),-1,1,0,height);
    fill(127);
    stroke(255);
    line(width/2,height/2,x,y);
    ellipse(x,y,20,20);
    a += aV;
  }
}
