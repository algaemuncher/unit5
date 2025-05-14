import processing.sound.*;

PImage scren;
int i, j, k=0, l=255;
float ax=0, ay=0, bx=0, by=0;

SoundFile defeat;

float player1y = 100, player1x = 100;
float player1d = 100;

float player2y = 700, player2x = 700;
float player2d = 100;

boolean wKey, aKey, dKey, sKey, fKey, hKey, upKey, downKey, rightKey, leftKey;
float ballx, bally, balld, bspeed;
float vx, vy;

int gamestate;
final int intro = 0;
final int playing = 1;
final int paused = 2;
final int game_over = 3;

int ballstate;
final int inactive = 0;
final int thrown = 1;

int ballpossesion;
final int p1 = 0;
final int p2 = 1;

void setup() {
  size(800, 800, P2D);
  ballx = width/2;
  bally = height/2;
  balld = 50;
  ballstate = inactive;
  gamestate = intro;
  scren = loadImage("scren.png");
  defeat = new SoundFile(this, "anti-yt-shorts.mp3");
  vx = 8;
  vy = 8;
  bspeed = 18;
}

void draw() {
  if (gamestate == playing) {
    game();
  } else if (gamestate == intro) {
    intro();
  } else if (gamestate == game_over) {
    gOver();
  } else if (gamestate == paused) {
    paused();
  }
}

void ball() {
  if (ballstate==thrown) {
    noStroke();
    fill(255, 0, 0);
    circle(ballx, bally, balld);
    circle((ballx- bx*j)+ (cos(acos(bx/bspeed) +(PI/6))*bspeed*j), (bally-by*j)+ (sin(asin(by/bspeed) +(PI/6))*bspeed*j), balld);
    circle((ballx- bx*j)+ (cos(acos(bx/bspeed) -(PI/6))*bspeed*j), (bally-by*j)+ (sin(asin(by/bspeed) -(PI/6))*bspeed*j), balld);
    //println((ballx- bx*j)+ (cos(acos(bx/15) +(PI/4))*20*j));
    //circle(shooting player coordinates) + (original ball angle ± new ball angle adjustment) * speed * frame # after shoot, ball diameter;
    //^^^ circle((ballx- bx*j)+cos(bx/15+(PI/4))*15*j, (bally-by*j)+sin(bx/15+(PI/4))*15*j, balld);
  }
  if (ballx < -25 || ballx > width+25 || bally < -25 || bally > height + 25) {
    ballstate = inactive;
    ballx = 300;
    bally = 300;
    if (ballpossesion == p1) {
      ballpossesion = p2;
    } else if (ballpossesion == p2) {
      ballpossesion = p1;
    }
  }
  if (ballpossesion ==p2 && ballstate == thrown) {
    if (dist(ballx, bally, player1x, player1y) < player1d/2 + balld/2) {
      gamestate = game_over;
      k=0;
      l=255;
    } else if (dist((ballx- bx*j)+ (cos(acos(bx/bspeed) +(PI/6))*bspeed*j), (bally-by*j)+ (sin(asin(by/bspeed) +(PI/6))*bspeed*j), player1x, player1y) < player1d/2 + balld/2) {
      gamestate = game_over;
      k=0;
      l=255;
    } else if (dist((ballx- bx*j)+ (cos(acos(bx/bspeed) -(PI/6))*bspeed*j), (bally-by*j)+ (sin(asin(by/bspeed) -(PI/6))*bspeed*j), player1x, player1y) < player1d/2 + balld/2) {
      gamestate = game_over;
      k=0;
      l=255;
    }
  }
  if (ballpossesion ==p1 && ballstate== thrown) {
    if (dist(ballx, bally, player2x, player2y) < player2d/2 + balld/2) {
      gamestate = game_over;
      k=0;
      l=255;
    } else if (dist((ballx- bx*j)+ (cos(acos(bx/bspeed) +(PI/6))*bspeed*j), (bally-by*j)+ (sin(asin(by/bspeed) +(PI/6))*bspeed*j), player2x, player2y) < player2d/2 + balld/2) {
      gamestate = game_over;
      k=0;
      l=255;
    } else if (dist((ballx- bx*j)+ (cos(acos(bx/bspeed) -(PI/6))*bspeed*j), (bally-by*j)+ (sin(asin(by/bspeed) -(PI/6))*bspeed*j), player2x, player2y) < player2d/2 + balld/2) {
      gamestate = game_over;
      k=0;
      l=255;
    }
  }
}


void p1move() {
  if (ballpossesion == p2) {
    if (wKey) {
      player1y = player1y + sin(ax)*5; //multiplier = speed ("sin(ax)*5")
      player1x = player1x + cos(ax)*5; //5 controls distance per move
      if (player1x < player1d/2 || width-player1d/2 < player1x || player1y < player1d/2 || height-player1d/2 < player1y) {
        player1y = player1y - sin(ax)*5;
        player1x = player1x - cos(ax)*5;
      }
    }
    if (sKey) {
      player1y = player1y - sin(ax)*5;
      player1x = player1x - cos(ax)*5;
      if (player1x < player1d/2 || width-player1d/2 < player1x || player1y < player1d/2 || height-player1d/2 < player1y) {
        player1y = player1y + sin(ax)*5;
        player1x = player1x + cos(ax)*5;
      }
    }
  }
  if (aKey) ax-=0.1;
  if (dKey) ax+=0.1;
  if (fKey) {
    if (ballpossesion == p1 && ballstate != thrown) {
      ballstate = thrown;
      ballx = player1x;
      bally = player1y;
      by = sin(ax)*bspeed;
      bx = cos(ax)*bspeed;
      j=0;
      //by = (mouseY - bally)/10;
      //bx = ( mouseX - ballx)/10;
      //if (dist(mouseX, mouseY, ballx, bally) > 300) {
      //  by = (mouseY - bally)/30;
      //  bx = ( mouseX - ballx)/30;
    }
  }
}

void p2move() {
  if (ballpossesion == p1) {
    if (upKey) {
      player2y = player2y + sin(ay)*5; //multiplier = speed ("sin(ax)*5")
      player2x = player2x + cos(ay)*5; //5 controls distance per move
      if (player2x < player2d/2 || width-player2d/2 < player2x || player2y < player2d/2 || height-player2d/2 < player2y) {
        player2y = player2y - sin(ay)*5;
        player2x = player2x - cos(ay)*5;
      }
    }
    if (downKey) {
      player2y = player2y - sin(ay)*5;
      player2x = player2x - cos(ay)*5;
      if (player2x < player2d/2 || width-player2d/2 < player2x || player2y < player2d/2 || height-player2d/2 < player2y) {
        player2y = player2y + sin(ay)*5;
        player2x = player2x + cos(ay)*5;
      }
    }
  }
  if (leftKey) ay-=0.1;
  if (rightKey) ay+=0.1;
  if (hKey) {
    if (ballpossesion == p2 && ballstate != thrown) {
      ballstate = thrown;
      ballx = player2x;
      bally = player2y;
      by = sin(ay)*bspeed;
      bx = cos(ay)*bspeed;
      j=0;
    }
  }
}
