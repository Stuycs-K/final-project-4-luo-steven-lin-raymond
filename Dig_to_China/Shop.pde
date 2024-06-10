public class Shop {
  
  private Button start;
  private Button max;
  private Button digUpgrade;
  private Button bombs;
  private int digUpgradeLevel = 0;
  private boolean digUpgradeApplied = false;
  
  public Shop() {
    int buttonWidth = 350;
    int buttonHeight = 70;
    int leftButton = width/2 - 200;
    int rightButton = width/2 + 200;

    start = new Button(leftButton, height-200, buttonWidth, buttonHeight);
    start.text = "+3 seconds to start\n7 DIAMONDS";
    
    max = new Button(rightButton, height-200, buttonWidth, buttonHeight);
    max.text = "+3 seconds to max\n10 DIAMONDS, 2 URANIUM";
    
    digUpgrade = new Button(leftButton, height-400 + buttonHeight + 50, buttonWidth, buttonHeight);
    digUpgrade.text = "Increase Dig Distance\n10 DIAMONDS, 5 URANIUM, 1 TITANIUM";
    
    bombs = new Button(rightButton, height-400 + buttonHeight + 50, buttonWidth, buttonHeight);
    bombs.text = "+1 Bomb\n3 DIAMONDS";
  }
  
  private void updateDigUpgradeText() {
      switch (digUpgradeLevel) {
          case 0:
              digUpgrade.text = "Increase Dig Distance\n1 DIAMOND, 1 URANIUM, 1 TITANIUM";
              break;
          case 1:
              digUpgrade.text = "Increase Dig Distance\n1 DIAMOND, 1 URANIUM, 1 TITANIUM";
              break;
          case 2:
              digUpgrade.text = "Max Dig Distance\n1 DIAMOND, 1 URANIUM, 1 TITANIUM";
              break;
          default:
              digUpgrade.text = "Max Level Reached";
              digUpgrade.enabled = false;
              break;
      }
  }
  
  public void display() {
    start.display();
    max.display();
    digUpgrade.display();
    bombs.display();
    
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
    
    if(fulfilledBomb()) {
      bombs.fulfilled = true;
    } else {
      bombs.fulfilled = false;
    }
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
    if(bombs.isMouseOver(mouseX, mouseY)) {
      bombs.press();
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
    if(bombs.isMouseOver(mouseX, mouseY)) {
      bombs.release();
      if(fulfilledBomb()) {
        applyBomb();
      }
    }
  }
  
  public void applyStart(int amount) {
    timer.addStartTime(amount);
    HashMap<String, Integer> inv = player.getInventory();
    inv.put("DIAMOND", inv.get("DIAMOND")-7);
  }
  
  public void applyMax(int amount) {
    timer.setMaxTime(timer.getMaxTime() + amount);
    HashMap<String, Integer> inv = player.getInventory();
    inv.put("DIAMOND", inv.get("DIAMOND")-10);
    inv.put("URANIUM", inv.get("URANIUM")-2);
  }
  
  public void applyDigUpgrade() {
      digUpgradeLevel++;
      digUpgradeApplied = true;
      switch (digUpgradeLevel) {
          case 1:
              player.range = 3; 
              break;
          case 2:
              player.range = 5; 
              break;
          default:
              player.range = 5; 
              break;
      }
      HashMap<String, Integer> inv = player.getInventory();
      inv.put("DIAMOND", inv.get("DIAMOND") - 0);
      inv.put("URANIUM", inv.get("URANIUM") - 0);
      inv.put("TITANIUM", inv.get("TITANIUM") - 0);
      updateDigUpgradeText();
  }

  public void applyBomb() {
    HashMap<String, Integer> inv = player.getInventory();
    inv.put("DIAMOND", inv.get("DIAMOND")-3);
    inv.put("BOMB", inv.get("BOMB")+1);
  }
  
  public boolean fulfilledStart() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 7;
  }
  
  public boolean fulfilledMax() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 10 && inv.get("URANIUM") >= 2;
  }
  
  
  public boolean fulfilledDigUpgrade() {
      HashMap<String, Integer> inv = player.getInventory();
      return inv.get("DIAMOND") >= 0 && inv.get("URANIUM") >= 0 && inv.get("TITANIUM") >= 0;
  }
  
  public boolean isDigUpgradeApplied() {
    return digUpgradeApplied;
  } 
  
  public boolean fulfilledBomb() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 3;
  }
  
  public void keyRelease(char key_) {
    
  }
}
