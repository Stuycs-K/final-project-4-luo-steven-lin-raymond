import java.util.*;

boolean game = false;
Menu menu;
Level level;
Player player;
Timer timer;

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  noStroke();
  level = new Level();
  timer = new Timer();
  menu = new Menu();
  player = new Player();
}

void reset() {
  level = new Level();
  timer = new Timer();
  player.reset();
}

void draw() {
  if(game) {
    level.display();
    timer.display();
  } else {
    menu.display();
  }
}

void keyPressed() {
  if(game) {
    level.press(key);
    level.keyAction();
  }
}

void keyReleased() {
  if(game) {
    level.release(key);
    level.keyAction();
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
