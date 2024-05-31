public class Menu {
  private Button begin;
  private Button startTimeExtend;
  private Button maxTimeExtend;
  private boolean[] inputs;
  TimeModifier timeMod;
  
  public Menu() {
    timeMod = new TimeModifier();
    
    begin = new Button(width/2, height - 100, 200, 50);
    begin.text = "Begin Game";
    begin.hover1BgColor = color(100);
    begin.hover1TextColor = color(0);
    
    startTimeExtend = new Button(width/2 - 150, height - 200, 200, 50);
    startTimeExtend.text = "+3 seconds to start\nCost: ?";
    
    maxTimeExtend = new Button(width/2 + 150, height - 200, 200, 50);
    maxTimeExtend.text = "+3 seconds to max\nCost: ?";
    
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
    text("Max Depth: " + player.getMaxDepth(), width/2, height/2 - 200);
    text("Last Depth: " + player.getPrevDepth(), width/2, height/2 - 150);
    
    fill(255);
    textSize(24);
    HashMap<String, Integer> inv = player.getInventory();
    text("Diamond Amount: " + inv.get("DIAMOND"), width/2, height/2 - 50);
    text("Uranium Amount: " + inv.get("URANIUM"), width/2, height/2);
    text("Titanium Amount: " + inv.get("TITANIUM"), width/2, height/2 + 50);
    
    startTimeExtend.display();
    maxTimeExtend.display();
    
  }
  
  public boolean[] getInputs() {
    return inputs;
  }
  
  public void press() {
    if(begin.isMouseOver(mouseX, mouseY)) {
      begin.press();
    }
    if(startTimeExtend.isMouseOver(mouseX, mouseY)) {
      startTimeExtend.press();
    }
    if(maxTimeExtend.isMouseOver(mouseX, mouseY)) {
      maxTimeExtend.press();
    }
  }
  
  public void release() {
    if (begin.isPressed() && begin.isMouseOver(mouseX, mouseY)) {
      game = true;
      begin.release();
    }
    if(startTimeExtend.isMouseOver(mouseX, mouseY)) {
      startTimeExtend.release();
      if(timeMod.fulfilledStart()) {
        timeMod.applyStart(3);
      }
    }
    if(maxTimeExtend.isMouseOver(mouseX, mouseY)) {
      maxTimeExtend.release();
      if(timeMod.fulfilledMax()) {
        timeMod.applyMax(3);
      }
      else {
      }
    }
  }
}
