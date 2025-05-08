int i =0;
float ax=0, ay=0;

float player1y = 300, player1x = 300;
float player1d = 150;

boolean wKey, aKey, dKey, sKey, nKey, upKey, downKey, rightKey, leftKey;
float ballx, bally, balld;
float vx, vy;

int ballstate;
final int inactive = 0;
final int thrown = 1;

void setup() {
  size(600, 600, P2D);
  ballx = width/2;
  bally = height/2;
  balld = 50;
  ballstate = inactive;
  vx = 8;
  vy = 8;
}

void draw() {
  background(142);
  ball();
  i=0;
  ballx += vx;
  bally += vy;
  pushMatrix();
  translate(player1x, player1y);
  fill(0, 0, 255);
  rotate(ax);
  noStroke();
  circle(0, 0, player1d);

  //println(player1x);
  //println(player1y);

  stroke(0);
  strokeWeight(3);
  line(0, 0, 0 + player1d/2, 0);
  popMatrix();

  p1move();

  //if (bally <= 0 + balld/2 || bally >= height - balld/2) vy = -vy;

  //if (ballx <= 0 + balld/2 || ballx >= width - balld/2) vx = -vx;

  if (dist(player1x, player1y, ballx, bally)<=(player1d/2 + balld/2 + 1)) {
    vx = (ballx-player1x)/5;
    vy = (bally-player1y)/5;
  }
}

void ball() {
  if (ballstate==thrown) {
    noStroke();
    fill(255, 0, 0);
    circle(ballx, bally, balld);
  }
  if (ballx < -25 || ballx > width+25 || bally < -25 || bally > height + 25) {
    ballstate = inactive;
  }
}

void keyPressed() {
  if (key == 'w') wKey = true;
  if (key == 'a') aKey = true;
  if (key == 's') sKey = true;
  if (key == 'd') dKey = true;
  if (key == 'n') nKey = true;
}

void keyReleased() {
  if (key == 'w') wKey = false;
  if (key == 'a') aKey = false;
  if (key == 's') sKey = false;
  if (key == 'd') dKey = false;
  if (key == 'n') nKey = false;
}

void p1move() {
  if (wKey) {
    player1y = player1y + sin(ax)*5; //multiplier = speed ("sin(ax)*5")
    player1x = player1x + cos(ax)*5; //5 controls distance per move
  }
  if (aKey) ax-=0.1;
  if (sKey) {
    player1y = player1y - sin(ax)*5;
    player1x = player1x - cos(ax)*5;
  }
  if (dKey) ax+=0.1;
  if (nKey) {
    ballstate = thrown;
    ballx = 300;
    bally = 300;
  }
}
