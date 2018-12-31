CA ca;

void setup() {
  size(1000, 800);
  frameRate(24);
  background(255);
  //int[] ruleset = {0, 1, 1, 1, 1, 0, 1, 1}; // Rule 222
  //int[] ruleset = {0, 1, 1, 1, 1, 1, 0, 1}; // Rule 190
  //int[] ruleset = {0, 1, 1, 1, 1, 0, 0, 0}; // Rule 30
  //int[] ruleset = {0, 1, 1, 1, 0, 1, 1, 0}; // Rule 110
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0}; // Rule 90
  
  ca = new CA(ruleset);
  background(255);
}

void draw() {
  ca.generate();
  ca.display();
}
