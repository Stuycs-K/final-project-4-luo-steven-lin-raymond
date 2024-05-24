public class Menu {
  private Button begin;
  private boolean[] inputs;
  
  public Menu() {
    begin = new Button(width/2, height - 100, 200, 50);
    begin.setText("Begin Game");
    begin.setBgColor(color(255), color(0, 255, 0));
    begin.setTextColor(color(0), color(0));
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
    if(begin.isMouseOver(mouseX, mouseY)) {
      begin.press();
    }
  }
  
  public void release() {
    if (begin.isPressed() && begin.isMouseOver(mouseX, mouseY)) {
      game = true;
      begin.release();
    }
  }
}
