int i = 0;
float player1y,player1x = 0;
boolean wKey, upKey,rightKey,leftKey,downKey;
void setup(){
  size(500,500);
}

void draw(){
  background(142);
  p1move();
  circle(player1x,player1y,50);
  if (wKey) player1y -= 5;
}

void keyPressed(){
  if (key == 'w') wKey = true;
  
  if (key == 'd') wKey = true;
  
  if (keyCode == UP) upKey = true;
  
  if (keyCode == RIGHT) rightKey = true;
}

void keyReleased(){
  if (key == 'w') wKey = false;
  if (key == 'd') wKey = false;
  
  if (keyCode == UP) upKey = false;
  if (keyCode == RIGHT) rightKey = false;
}

void p1move(){
  if (wKey) player1y -= 5;
  if (righ
}
