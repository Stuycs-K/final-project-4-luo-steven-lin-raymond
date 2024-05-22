public class Menu {
  Button test = new Button(50, 50, 50, 50);
  
  public void display() {
    background(255);
    textSize(36);
    fill(0);
    text("MENU", width/2, 50);
    test.display();
  }
  
  public void mouseAction() {
    if(test.isPressed()) {
      println("PRESSED");
    }
  }
  
  public void keyAction(char key_) {
  }
}
