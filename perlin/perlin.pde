int scale = 2, rows, cols;

void setup() {
  size(600, 400);
  rows = height/scale;
  cols = width/scale;
}

void draw() {
  background(255);
  noStroke();
  for(int i=0;i<height;i+=scale) {
    for(int j=0;j<width;j+=scale) {
      float n = noise(i+j);
      float clr = map(n, -1, 1, 0, 255);
      fill(clr);
      rect(j, i, scale, scale);
    }
  }
}
