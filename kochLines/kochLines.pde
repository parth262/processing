ArrayList<KochLine> lines;

void setup() {
  size(1000, 800);
  lines = new ArrayList();
  KochLine l = new KochLine(new PVector(0, height/1.5), new PVector(width, height/1.5));
  lines.add(l);
}

void draw() {
  background(255);
  for(KochLine l: lines) {
    l.display();
  }
}

void keyPressed() {
  if(key == ' ') {
    generate();
  }
}

void generate() {
  ArrayList<KochLine> next = new ArrayList();
  for(KochLine l: lines) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();
    
    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }
  lines = next;
}
