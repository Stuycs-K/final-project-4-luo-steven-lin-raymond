boolean game = false;
Menu menu = new Menu();
Level level = new Level();

void setup() {
  size(800, 800);
}

void draw() {
  if(game) {
    level.display();
  } else {
    menu.display();
  }
}

void keyPressed() {
  game = !game;
}
