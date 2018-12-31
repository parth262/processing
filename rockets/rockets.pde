int lifetime;
PVector target;
int lifeCounter;
Population population;
int score;
int vehicles;
ArrayList<Obstacle> obstacles;

void setup() {
  size(600, 400, P2D);
  smooth();
  obstacles = new ArrayList();
  Obstacle a = new Obstacle(150, 300, 300, 10);
  Obstacle b = new Obstacle(0, 200, 250, 10);
  Obstacle c = new Obstacle(350, 200, 250, 10);
  obstacles.add(a);
  //obstacles.add(b);
  //obstacles.add(c);
  vehicles = 500;
  lifetime = 400;
  lifeCounter = 0;
  target = new PVector(width/2, 24);
  float mutationRate = 0.01;
  population = new Population(mutationRate, vehicles);
}

void draw() {
  background(255);
  for(Obstacle o: obstacles) {
    o.display();
  }
  fill(150);
  ellipse(target.x, target.y, 24, 24);
  
  if(lifeCounter < lifetime) {
    population.live();
    lifeCounter++;
  } else {
    score = population.calculateScore();
    lifeCounter = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }
  
  fill(0);
  text("Generation #: " + population.getGenerations(), 10, 18);
  text("Cycles left: " + (lifetime-lifeCounter), 10, 36);
  text("Score: " + score + "/" + vehicles, 10, 54);

}

void keyPressed() {
  if(key == ' ') {
    noLoop();
  }
}
