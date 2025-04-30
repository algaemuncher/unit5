color black = #000000;

float i =0;

float ballx,bally, balld;
float vx,vy;


void setup(){
  size(600,600,P2D);
  ballx = width/2;
  bally = height/2;
  balld = 50;
  
  vx = 0.3;
  vy = 0.3;
}

void draw(){
  background(142);
  //stroke(black);
  //strokeWeight(3);
  noStroke();
  fill(255,0,0);
  circle(ballx,bally,balld);
  i=0;
  while(i<7){
    fill(255,0,0,255-i*35);
    circle(300+ cos(vx-i*0.5)*150,300 +sin(vy-i*0.5)*150,balld);
    i = i+1;
  }
  
  ballx = 300+cos(vx) * 150;
  bally = 300+sin(vy)*150;
  vx += 0.1;
  vy += 0.1;
  
  if (bally <= 0 + balld/2 || bally >= height - balld/2) vy = -vy;
  
  if (ballx <= 0 + balld/2 || ballx >= width - balld/2) vx = -vx;
}
