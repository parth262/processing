PVector ray1;
PVector origin;
PVector ray2;

void setup() {
  size(600, 400);
  origin = new PVector(30, 250);
  ray1 = new PVector(500, 250);
  ray2 = new PVector(300, 150);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(3);
  ray2.x = mouseX;
  ray2.y = mouseY;
  PVector normal = scalarProjection(ray2, origin, ray1);
  line(origin.x, origin.y, ray1.x, ray1.y);
  line(origin.x, origin.y, ray2.x, ray2.y);
  fill(255, 0, 0);
  strokeWeight(1);
  line(ray2.x, ray2.y, normal.x, normal.y);
  ellipse(normal.x, normal.y, 10, 10);
}

PVector scalarProjection(PVector p, PVector a, PVector b) {
  PVector ap = PVector.sub(p, a);
  PVector ab = PVector.sub(b, a);
  ab.normalize();
  ab.mult(ap.dot(ab));
  PVector normalPoint = PVector.add(a, ab);
  return normalPoint;
}
