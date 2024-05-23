import java.util.*;

boolean game = false;
Menu menu;
Level level;

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  menu = new Menu();
  level = new Level();
}

void draw() {
  if(game) {
    level.display();
  } else {
    menu.display();
  }
}

void keyPressed() {
  if(game) {
    level.keyAction(key);
  } else {
    menu.keyAction(key);
  }
}

void mousePressed() {
  menu.mouseAction();
}
