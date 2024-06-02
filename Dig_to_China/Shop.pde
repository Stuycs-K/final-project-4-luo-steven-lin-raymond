public class Shop {
  
  private Button start;
  private Button max;
  private Button digUpgrade;
  private boolean digUpgradeApplied = false;
  
  public Shop() {
    int buttonWidth = 300;
    int buttonHeight = 70;
    int leftButton = 200;
    int rightButton = 600;

    start = new Button(leftButton, height-200, buttonWidth, buttonHeight);
    start.text = "+3 seconds to start\nCost: 4 DIAMONDS";
    
    max = new Button(rightButton, height-200, buttonWidth, buttonHeight);
    max.text = "+3 seconds to max\nCost: 10 DIAMONDS, 2 URANIUM";
    
    digUpgrade = new Button(200, height-400 + buttonHeight + 50, buttonWidth, buttonHeight);
    digUpgrade.text = "Increase Dig Distance\nCost: 10 DIAMONDS, 5 URANIUM";
  }
  
  public void display() {
    start.display();
    max.display();
    digUpgrade.display();
    
    if(fulfilledStart()) {
      start.fulfilled = true;
    } else {
      start.fulfilled = false;
    }
    
    if(fulfilledMax()) {
      max.fulfilled = true;
    } else {
      max.fulfilled = false;
    }
    
    digUpgrade.fulfilled = fulfilledDigUpgrade();
  }
  
  public void press() {
    if(start.isMouseOver(mouseX, mouseY)) {
      start.press();
    }
    if(max.isMouseOver(mouseX, mouseY)) {
      max.press();
    }
    if (digUpgrade.isMouseOver(mouseX, mouseY)) {
      digUpgrade.press();
    }
  }
  
  public void release() {
    if(start.isMouseOver(mouseX, mouseY)) {
      start.release();
      if(fulfilledStart()) {
        applyStart(3);
      }
    }
    if(max.isMouseOver(mouseX, mouseY)) {
      max.release();
      if(fulfilledMax()) {
        applyMax(3);
      }
    }
    if (digUpgrade.isMouseOver(mouseX, mouseY)) {
      digUpgrade.release();
      if (fulfilledDigUpgrade()) {
        applyDigUpgrade();
      }
    }
  }
  
  public void applyMax(int amount) {
    timer.setMaxTime(timer.getMaxTime() + amount);
    HashMap<String, Integer> inv = player.getInventory();
    inv.put("DIAMOND", inv.get("DIAMOND")-10);
    inv.put("URANIUM", inv.get("URANIUM")-2);
  }
  
  public void applyStart(int amount) {
    timer.addTime(amount);
    HashMap<String, Integer> inv = player.getInventory();
    inv.put("DIAMOND", inv.get("DIAMOND")-4);
  }
  
  public void applyDigUpgrade(){
    digUpgradeApplied = true;
    HashMap<String, Integer> inv = player.getInventory();
    inv.put("DIAMOND", inv.get("DIAMOND") - 10);
    inv.put("URANIUM", inv.get("URANIUM") - 5);
  }
  
  public boolean fulfilledStart() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 4;
  }
  
  public boolean fulfilledMax() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 10 && inv.get("URANIUM") >= 2;
  }
  
  
  public boolean fulfilledDigUpgrade() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 10 && inv.get("URANIUM") >= 5;
  }

  public boolean isDigUpgradeApplied() {
    return digUpgradeApplied;
  } 
}
