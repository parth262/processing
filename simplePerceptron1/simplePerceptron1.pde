Point[] points = new Point[200];
Perceptron brain;

void setup() {
  size(600, 600);
  brain = new Perceptron(3);
  for(int i=0;i<points.length;i++) {
    points[i] = new Point(random(-1, 1), random(-1, 1));
  }
}

void draw() {
  background(51);
  
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  stroke(0);
  line(p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());
  
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  line(p3.pixelX(), p3.pixelY(), p4.pixelX(), p4.pixelY());
  
  for(Point pt: points) {
    pt.show();
  }
  
  for(Point pt: points) {
    float[] inputs = {pt.x, pt.y, pt.bias};
    //brain.train(inputs, pt.label);
    float guess = brain.guess(inputs);
    if(guess == pt.label) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.pixelX(), pt.pixelY(), 8, 8);
  }
}

void keyPressed() {
  if(key == ' ') {
    for(Point pt: points) {
      float[] inputs = {pt.x, pt.y, pt.bias};
      brain.train(inputs, pt.label);
    }
  }
}
