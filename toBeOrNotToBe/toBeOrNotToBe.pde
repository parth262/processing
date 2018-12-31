PFont font;
String target;
int popMax;
float mutationRate;
Population population;

void setup() {
  size(1000, 800);
  font = createFont("Courier", 32, true);
  target = "To be or not to be.";
  popMax = 300;
  mutationRate = 0.02;
  
  population = new Population(target, mutationRate, popMax);
}

void draw() {
  population.naturalSelection();
  population.generate();
  population.calcFitness();
  displayInfo(); 
  
  if(population.finished()) {
    println(millis()/1000);
    noLoop();
  }
}

void displayInfo() {
  background(255);
  String answer = population.getBest();
  textFont(font);
  textAlign(LEFT);
  fill(0);
  
  textSize(20);
  text("Best Phrase", 20, 30);
  textSize(32);
  text(answer, 20, 75);
  
  textSize(16);
  text("total generations: " + population.getGeneration(), 20, 140);
  text("average fitness: " + nf(population.getAverageFitness(), 0, 2), 20, 160);
  text("total populationation: " + popMax, 20, 180);
  text("mutation rate: " + int(mutationRate * 100) + "%", 20, 200);
  
  textSize(15);
  text("All phrases:\n" + population.allPhrases(), 650, 10);
}
