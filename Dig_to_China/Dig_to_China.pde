import java.util.*;

boolean game = false;
Menu menu;
Level level;
Player player;
Timer timer;
Mole mole;

void setup() {
  size(800, 800);
  noStroke();
  level = new Level();
  timer = new Timer();
  menu = new Menu();
  player = new Player();
  mole = new Mole();
}

<<<<<<< HEAD
=======
void reset() {
  game = false;
  level = new Level();
  timer.reset();
  player.reset();
  mole = new Mole();
}

>>>>>>> 9df77a54104d0732a21002e3560a932b6128c7b9
void draw() {
  if(game) {
    level.display();
    timer.display();
  } else {
    menu.display();
  }
}

void showEndScreen() {
    background(0); 
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text("You've Reached China!", width / 2, height / 2);
    textSize(20);
    text("Press 'R' to Reset", width / 2, height / 2 + 50);
    game = false;
}

void keyPressed() {
  if(game) {
    if(key == CODED) {
      level.press(keyCode, true);
        } else {
            level.press(key, false);
        }
        level.keyAction();
  }
}

void reset() {
  game = false;
  level = new Level();
  timer.reset();
  player.reset();
}


void keyReleased() {
  if(game) {
    if(key == CODED) {
      level.release(keyCode, true);
    } else {
      level.release(key, false);
    }
    level.keyAction();
  }
  else {
    menu.keyRelease(key);
  }
}

void mousePressed() {
  if(!game) {
    menu.press();
  }
}

void mouseReleased() {
  if(!game) {
    menu.release();
  }
}
