class CA {

  int[] cells;
  int generation;
  int[] ruleset;
  
  int w= 2;
  
  CA(int[] ruleset) {
    this.ruleset = ruleset;
    cells = new int[width/w];
    for(int i=0;i< cells.length;i++) {
      cells[i] = 0;
    }
    
    cells[cells.length/2] = 1;
    generation = 0;
  }
  
  void generate() {
    int[] nextgen = new int[cells.length];
    
    for(int i=1;i<cells.length-1;i++) {
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rule(left, me, right);
    }
    
    cells = nextgen;
    generation++;
  }
  
  int rule(int left, int me, int right) {
    return ruleset[calculatePosition(left, me, right)];
  }
  
  int flip(int n) {
    return n;
  }
  
  int calculatePosition(int a, int b, int c) {
    return 4*flip(a) + 2*flip(b) + flip(c);
  }
  
  void display() {
    for(int i=0;i<cells.length;i++) {
      if(cells[i] == 1) fill(0);
      else fill(255);
      noStroke();
      rect(i*w, generation*w, w, w);
    }    
  }
}
