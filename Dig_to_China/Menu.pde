public class Menu {
  private Button begin;
  private boolean[] inputs;
  private Shop shop;
  private boolean complete;
  
  public Menu() {
    shop = new Shop();
    
    begin = new Button(width/2, height - 100, 200, 50);
    begin.text = "Begin Game";
    begin.hover1BgColor = color(100);
    begin.hover1TextColor = color(0);
    
    inputs = new boolean[10];
    complete = false;
  }
  
  public void display() {
    textAlign(CENTER, CENTER);
    background(0);
    textSize(36);
    
    if(complete) {
      fill(255);
      text("You've Reached China!", width / 2, height / 2);
      return;
    }
    
    fill(255);
    text("MENU", width/2, 50);
    begin.display();
    
    fill(255);
    textSize(24);
    text("Max Depth: " + player.getMaxDepth(), width/2 - 150, height/2 - 300);
    text("Last Depth: " + player.getPrevDepth(), width/2 + 150, height/2 - 300);
    
    fill(255);
    textSize(24);
    HashMap<String, Integer> inv = player.getInventory();
    text("Diamond Amount: " + inv.get("DIAMOND"), width/2, height/2 - 250);
    text("Uranium Amount: " + inv.get("URANIUM"), width/2, height/2 - 200);
    text("Titanium Amount: " + inv.get("TITANIUM"), width/2, height/2 - 150);
    
    text("Number of Bombs: " + inv.get("BOMB"), width/2, height/2 - 100);
    text("Starting Time: " + timer.startTime + " s", width/2 - 150, height/2 - 50);
    text("Max Time: " + timer.maxTime + " s", width/2 + 150, height/2 - 50);
    
    String dig_size = "Dig Size: ";
    if(shop.digUpgradeLevel == 0) {
      dig_size += "1x1";
    }
    else if(shop.digUpgradeLevel == 1) {
      dig_size += "3x3";
    }
    else if(shop.digUpgradeLevel == 2) {
      dig_size += "5x5";
    }
    text(dig_size, width/2, height/2);
    
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
      reset();
      game = true;
      begin.release();
    }
    shop.release();
  }
  
  public void keyRelease(char key_) {
    shop.keyRelease(key_);
  }
}
