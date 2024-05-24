public class Menu {
  private Button begin;
  private boolean[] inputs;
  
  public Menu() {
    begin = new Button(width/2, height - 100, 200, 50, "Begin Game");
    inputs = new boolean[10];
  }
  
  public void display() {
    background(0);
    textSize(36);
    fill(255);
    text("MENU", width/2, 50);
    begin.display();
  }
  
  public boolean[] getInputs() {
    return inputs;
  }
  
  public void press() {
    if(begin.isPressed()) {
      game = !game;
    }
  }
  
  public void release() {
  }
  
}
