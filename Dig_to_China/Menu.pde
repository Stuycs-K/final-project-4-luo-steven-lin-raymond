public class Menu {
  private Button begin;
  private boolean[] inputs;
  Shop shop;
  
  public Menu() {
    shop = new Shop();
    
    begin = new Button(width/2, height - 100, 200, 50);
    begin.text = "Begin Game";
    begin.hover1BgColor = color(100);
    begin.hover1TextColor = color(0);
    
    inputs = new boolean[10];
  }
  
  public void display() {
    textAlign(CENTER, CENTER);
    background(0);
    textSize(36);
    fill(255);
    text("MENU", width/2, 50);
    begin.display();
    
    fill(255);
    textSize(24);
    text("Max Depth: " + player.getMaxDepth(), width/2, height/2 - 300);
    text("Last Depth: " + player.getPrevDepth(), width/2, height/2 - 250);
    
    fill(255);
    textSize(24);
    HashMap<String, Integer> inv = player.getInventory();
    text("Diamond Amount: " + inv.get("DIAMOND"), width/2, height/2 - 200);
    text("Uranium Amount: " + inv.get("URANIUM"), width/2, height/2 - 150);
    text("Titanium Amount: " + inv.get("TITANIUM"), width/2, height/2 - 100);
    
    shop.display();
    
  }
  
  public boolean[] getInputs() {
    return inputs;
  }
  
  public void press() {
    if(begin.isMouseOver(mouseX, mouseY)) {
      begin.press();
    }
    shop.press();
  }
  
  public void release() {
    if (begin.isPressed() && begin.isMouseOver(mouseX, mouseY)) {
      game = true;
      begin.release();
    }
    shop.release();
  }
}
