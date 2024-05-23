public class Menu {
  Button begin;
  
  public Menu() {
    begin = new Button(width/2, height - 100, 200, 50, "Begin Game");
  }
  
  public void display() {
    background(0);
    textSize(36);
    fill(255);
    text("MENU", width/2, 50);
    begin.display();
  }
  
  public void mouseAction() {
    if(begin.isPressed()) {
      game = !game;
    }
  }
  
  public void keyAction(char key_) {
  }
}
