import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.geom.*;

VerletPhysics3D physics;

int rows = 50, cols = 50;
Particle[][] particles = new Particle[rows][cols];
ArrayList<Spring> springs;
float w = 10;

void setup() {
  size(1000, 800, P3D);
  physics = new VerletPhysics3D();
  physics.addBehavior(new GravityBehavior3D(new Vec3D(0, 1, 0)));
  
  springs = new ArrayList();
  
  
  float z = -300;
  for(int i=0;i<rows;i++) {
    float x = -300;
    for(int j=0;j<cols;j++) {
      Particle p = new Particle(x, 0, z);
      particles[i][j] = p;
      physics.addParticle(p);
      x = x + w;
    }
    z = z + w;
  }
  
  for(int i=0;i<rows-1;i++) {
    for(int j=0;j<cols;j++) {
      Particle a = particles[i][j];
      Particle b1 = particles[i+1][j];
      if(j != cols-1) {
        Particle b2 = particles[i][j+1];
        Spring spring2 = new Spring(a, b2, w);
        springs.add(spring2);
        physics.addSpring(spring2);
      }
      Spring spring1 = new Spring(a, b1, w);
      springs.add(spring1);
      physics.addSpring(spring1);
    }
  }
  
  particles[0][0].lock();
  particles[0][cols-1].lock();
  particles[rows-1][0].lock();
  particles[rows-1][cols-1].lock();
}

void draw() {
  physics.update();
  background(0);
  translate(width/2, height/2);
  
  //for(int i=0;i<rows;i++) {
  //  for(int j=0;j<cols;j++) {
  //    particles[i][j].display();
  //  }
  //}
  
  for(Spring s: springs) {
    s.display();
  }
}
