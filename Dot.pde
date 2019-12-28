Population test;
PVector goal = new PVector (400,10);

void settings(){
  size(800,800);
}
void setup(){
  test = new Population(1000);
  frameRate(10000);
}

void draw(){
  background(255);
  fill(255,0,0);
  ellipse(goal.x,goal.y,10,10);
  ///////obstacles 
  
  //fill(0,0,255);
  //rect(100,300,600,10);
  
  fill(0,0,255);
  rect(0,700,400,10);
  
  fill(0,0,255);
  rect(550,700,250,10);
  
  fill(0,0,255);
  rect(0,600,50,10);
  
  fill(0,0,255);
  rect(125,600,400,10);
  
  fill(0,0,255);
  rect(575,600,225,10);
  
  fill(0,0,255);
  rect(0,400,100,10);
  
  fill(0,0,225);
  rect(200,400,600,10);
  
  fill(0,0,225);
  rect(0,250,500,10);
  
  fill(0,0,255);
  rect(400,150, 400,10);
  
  if (test.allDotsDead()){
    test.calculatefitness();
    test.naturalselection();
    test.mutate();
  }else {
  test.update();
  test.show();
}
}
