
boolean debug = true;
Path p;
Vehicle car1;
Vehicle car2;

ArrayList<Vehicle> vehicles;

void setup() {
  size(600, 400);
  p = new Path();
  
  vehicles = new ArrayList();
  
  car1 = new Vehicle(new PVector(0, height/2), 2, 0.02);
  car2 = new Vehicle(new PVector(0, height/2), 3, 0.05);
}

void draw() {
  background(255);
  p.display();
  
  for(Vehicle v: vehicles) {
    v.follow(p);
    v.run();
    v.borders(p);
  }
  //car1.follow(p);
  //car2.follow(p);
  //car1.run();
  //car2.run();
  
  //car1.borders(p);
  //car2.borders(p);
}

void mousePressed() {
  vehicles.add(new Vehicle(new PVector(random(0, width/2), random(height/3, height/1.5)), random(2, 4), random(0.02, 0.08)));
}

void keyPressed() {
  if(key == ' ') {
    debug = !debug;
  }
}
