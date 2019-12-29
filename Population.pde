class Population{
  Dot[] dots;
  float fitnessSum = 0;
  int generation = 1;
  int bestDot = 0;
  int minsteps = 600;
  Population(int size){
    dots = new Dot[size];
    for (int i = 0; i<size; i++){
      dots[i] = new Dot();
    }
    
    
  }
  
  
  void show(){
    for (int i =1; i<dots.length; i++){
      dots[i].show();
      
    }
    dots[0].show();
    fill(0,0,0);
    text("Generation: ",20,20);
    text(generation,110,20);
    if(minsteps<800){
      text("Min Steps: ", 20, 50);
      text(minsteps,110,50);
    }  
    
  void update(){
    for (int i = 0; i<dots.length; i++){
      if (dots[i].brain.step > minsteps){
        dots[i].dead = true;
      
      } else{
      dots[i].update();
      }
    }
  }
  void calculatefitness() {
    for (int i = 0; i<dots.length; i++){
      dots[i].calculatefitness();
      
    }
  }
  
  boolean allDotsDead() {
    for (int i = 0; i<dots.length; i++){
      if (!dots[i].dead && !dots[i].reachedGoal){
        return false;
      }
    }
    return true;
  }
  
  void naturalselection() {
    Dot[] newDots = new Dot[dots.length];
    setBestDot();
    newDots[0] = dots[bestDot].Baby();
    newDots[0].isBest = true;
    calcfitnessSum();
    
    for(int i = 1; i< newDots.length; i++){
      
      Dot parent = selectParent();
      
      newDots[i] = parent.Baby();
      
    }
    
    dots = newDots.clone();
    generation ++;
  }
  void calcfitnessSum() {
    fitnessSum = 0;
    for (int i = 0; i<dots.length; i++){
      fitnessSum += dots[i].fitness;      
    }
  }
  
  
  Dot selectParent() {
    float rand = random(fitnessSum);
    float runningSum = 0;
    for (int i = 0; i<dots.length; i++){
      runningSum += dots[i].fitness;
      if (runningSum > rand) {
        return dots[i];
      }
    }
    return null;
  }
  void mutate(){
    for (int i = 1; i<dots.length; i++){
      dots[i].brain.mutate();
    }
  }
  void setBestDot(){
    float max =0;
    int maxIndex = 0;
    for (int i = 0; i<dots.length; i++){
      if (dots[i].fitness > max){
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    bestDot = maxIndex;
    
    if (dots[bestDot].reachedGoal){
      minsteps = dots[bestDot].brain.step;
      println("step:", minsteps);
    }
  }
}
