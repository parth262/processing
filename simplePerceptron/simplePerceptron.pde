Point[] points = new Point[100];
Perceptron brain;

void setup() {
  size(400, 400);
  brain = new Perceptron();
  for(int i=0;i<points.length;i++) {
    points[i] = new Point(random(width), random(height));
  }
}

void draw() {
  for(Point pt: points) {
    pt.show();
  }
  
  for(Point pt: points) {
    float[] inputs = {pt.x, pt.y};
    //brain.train(inputs, pt.label);
    float guess = brain.guess(inputs);
    if(guess == pt.label) {
      fill(0, 0, 255);
    } else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.x, pt.y, 8, 8);
    stroke(0);
    line(0, 0, width, height);
  }
}

void keyPressed() {
  if(key == ' ') {
    for(Point pt: points) {
      float[] inputs = {pt.x, pt.y};
      brain.train(inputs, pt.label);
    }
  }
}
