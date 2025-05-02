int i = 0;
float player1y,player1x = 300;
boolean wKey, aKey,dKey,sKey,upKey,rightKey,leftKey,downKey;
void setup(){
  size(500,500);
}

void draw(){
  background(142);
  p1move();
  circle(player1x,player1y,50);
}

void keyPressed(){
  if (key == 'w') wKey = true;
  if (key == 'a') aKey = true;
  if (key == 's') sKey = true;
  if (key == 'd') dKey = true;
  
  if (keyCode == UP) upKey = true;
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == DOWN) downKey = true;
  if (keyCode == RIGHT) rightKey = true;
}

void keyReleased(){
  if (key == 'w') wKey = false;
  if (key == 'a') aKey = false;
  if (key == 's') sKey = false;
  if (key == 'd') dKey = false;
  
  if (keyCode == UP) upKey = false;
  if (keyCode == UP) leftKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == RIGHT) rightKey = false;
}

void p1move(){
  if (wKey) player1y -= 5;
  if (aKey) player1x -= 5;
  if (sKey) player1y += 5;
  if (dKey) player1x += 5;
}
