// The activation function
int sign(float n) {
    if(n >= 0) {
      return 1;
    } else {
      return -1;
    }
  }

class Perceptron {
  
  float[] weights;
  float lr = 0.01;
  
  Perceptron(int n) {
    weights = new float[n];
    for(int i=0;i<weights.length;i++) {
      weights[i] = random(-1, 1);
    }
  }
  
  int guess(float[] inputs) {
    float sum = 0;
    for(int i=0;i<weights.length;i++) {
      sum += inputs[i] * weights[i];
    }
    return sign(sum);
  }
  
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;
    
    for(int i=0;i<weights.length;i++) {
      weights[i] += error * inputs[i] * lr;
    }
  }
  
  float guessY(float x) {
    float m = weights[0] / weights[1]; 
    float b = weights[2] / weights[1];
    return - m * x - b;
  }
}
