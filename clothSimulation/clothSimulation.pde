import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;

int rows = 50, cols = 50;
Particle[][] particles = new Particle[rows][cols];
ArrayList<Spring> springs;
float w = 10;

void setup() {
  size(1000, 800, P2D);
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  physics.setWorldBounds(new Rect(0,0,width,height));
  
  springs = new ArrayList();
  
  
  float y = 10;
  for(int i=0;i<rows;i++) {
    float x = 300;
    for(int j=0;j<cols;j++) {
      Particle p = new Particle(x, y);
      particles[i][j] = p;
      physics.addParticle(p);
      x = x + w;
    }
    y = y + w;
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
}

void draw() {
  physics.update();
  background(0);
  
  //for(int i=0;i<rows;i++) {
  //  for(int j=0;j<cols;j++) {
  //    particles[i][j].display();
  //  }
  //}
  
  for(Spring s: springs) {
    s.display();
  }
}
