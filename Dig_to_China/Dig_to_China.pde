boolean game = false;
Menu menu = new Menu();
Level level = new Level();

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
}

void draw() {
  if(game) {
    level.display();
  } else {
    menu.display();
  }
}

void keyPressed() {
  menu.keyAction(key);
  game = !game;
}

void mousePressed() {
  menu.mouseAction();
}
