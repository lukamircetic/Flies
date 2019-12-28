class Dot{
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;
  
  
  float fitness = 0;
Dot() {
  brain = new Brain(400);
  pos = new PVector(width/2, height-10);
  vel = new PVector(0,0);
  acc = new PVector(0,0);
  
  }
  


  void show(){
    if(isBest){
      fill(0,255,0);
      ellipse(pos.x,pos.y,8,8);
    } else {
    fill(0);
    ellipse(pos.x, pos.y,4,4);
    }
  }
  
  void move(){
    if(brain.directions.length > brain.step){
      acc = brain.directions[brain.step];
      brain.step++;
    }else{
      dead = true;
      
    }
    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }
  void update() {
    if ((dead == false) && (reachedGoal==false)){
      move();
      if(pos.x<2 || pos.y<2 || pos.x>width-2 || pos.y>height-2){
        dead = true;
      } else if(dist(pos.x,pos.y,goal.x,goal.y)<5){
        reachedGoal = true;
      } else if(pos.x< 400 && pos.y < 710 && pos.x > 0 && pos.y >700){
        dead = true;
      } else if(pos.x< 800 && pos.y < 710 && pos.x > 550 && pos.y >700){
        dead = true;
      } else if(pos.x< 50 && pos.y < 610 && pos.x > 0 && pos.y >600){
        dead = true;
      } else if(pos.x< 525 && pos.y < 610 && pos.x > 125 && pos.y >600){
        dead = true;
      } else if(pos.x< 800 && pos.y < 610 && pos.x > 575 && pos.y >600){
        dead = true;
      } else if(pos.x< 100 && pos.y < 410 && pos.x > 0 && pos.y >400){
        dead = true;
      } else if(pos.x< 800 && pos.y < 410 && pos.x > 200 && pos.y >400){
        dead = true;
      } else if(pos.x< 500 && pos.y < 260 && pos.x > 0 && pos.y >250){
        dead = true;
      } else if(pos.x< 800 && pos.y < 160 && pos.x > 400 && pos.y >150){
        dead = true;
      }
    
    }
  }
  void calculatefitness(){
    if (reachedGoal){
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step + brain.step);
      
  } else {
    float distanceToGoal = dist(pos.x,pos.y, goal.x, goal.y);
    fitness = 1.0/(distanceToGoal + distanceToGoal);
    }
  }
  
  Dot Baby() {
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  
  
  }
  
  
  
  
}
