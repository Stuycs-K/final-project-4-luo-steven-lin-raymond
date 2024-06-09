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
  
  private void updateDigUpgradeText(){
    if (digUpgradeLevel == 0){
      digUpgrade.text = "Increase Dig Distance\n10 DIAMONDS, 5 URANIUM, 1 TITANIUM";
    }
    else if (digUpgradeLevel == 1){
      digUpgrade.text = "Increase Dig Distance\n20 DIAMONDS, 10 URANIUM, 2 TITANIUM";
    }
    else if (digUpgradeLevel == 2){
      digUpgrade.text = "Increase Dig Distance\n40 DIAMONDS, 20 URANIUM, 4 TITANIUM";
    }
    else if (digUpgradeLevel == 3){
      digUpgrade.text = "Max Dig Distance\n80 DIAMONDS, 40 URANIUM, 10 TITANIUM";
    }
    else {
      digUpgrade.text = "Max Level Reached";
      digUpgrade.enabled = false; 
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
  
  public void applyDigUpgrade(){
    digUpgradeLevel++;
    digUpgradeApplied = true;
    player.range = digUpgradeLevel + 1;
    HashMap<String, Integer> inv = player.getInventory();
    if (digUpgradeLevel == 1){
      inv.put("DIAMOND", inv.get("DIAMOND") - 10);
      inv.put("URANIUM", inv.get("URANIUM") - 5);
      inv.put("TITANIUM", inv.get("TITANIUM") - 1);
    }
    else if (digUpgradeLevel == 2){
    inv.put("DIAMOND", inv.get("DIAMOND") - 20);
    inv.put("URANIUM", inv.get("URANIUM") - 10);
    inv.put("TITANIUM", inv.get("TITANIUM") - 2);
    }
    else if (digUpgradeLevel == 3){
    inv.put("DIAMOND", inv.get("DIAMOND") - 40);
    inv.put("URANIUM", inv.get("URANIUM") - 20);
    inv.put("TITANIUM", inv.get("TITANIUM") - 4);
    }
    else if (digUpgradeLevel == 4){
    inv.put("DIAMOND", inv.get("DIAMOND") - 80);
    inv.put("URANIUM", inv.get("URANIUM") - 40);
    inv.put("TITANIUM", inv.get("TITANIUM") - 10);
    }
    updateDigUpgradeText();
  }
  
  public void applyBomb() {
    HashMap<String, Integer> inv = player.getInventory();
    inv.put("DIAMOND", inv.get("DIAMOND")-3);
    inv.put("BOMB", inv.get("BOMB")+1);
  }
  
  public boolean fulfilledStart() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 7 && timer.startTime < timer.TIMER_THRESHOLD;
  }
  
  public boolean fulfilledMax() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 10 && inv.get("URANIUM") >= 2 && timer.maxTime < timer.TIMER_THRESHOLD;
  }
  
  
  public boolean fulfilledDigUpgrade() {
    HashMap<String, Integer> inv = player.getInventory();
    if (digUpgradeLevel == 0){
      return inv.get("DIAMOND") >= 10 && inv.get("URANIUM") >= 5 && inv.get("TITANIUM") >= 1;
    }
    else if (digUpgradeLevel == 1){
      return inv.get("DIAMOND") >= 20 && inv.get("URANIUM") >= 10 && inv.get("TITANIUM") >= 2;
    }
    else if (digUpgradeLevel == 2){
      return inv.get("DIAMOND") >= 40 && inv.get("URANIUM") >= 20 && inv.get("TITANIUM") >= 4;
    }
    else if (digUpgradeLevel == 3){
      return inv.get("DIAMOND") >= 80 && inv.get("URANIUM") >= 40 && inv.get("TITANIUM") >= 10;
    }
    return false;
  }

  public boolean isDigUpgradeApplied() {
    return digUpgradeApplied;
  } 
  
  public boolean fulfilledBomb() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 3;
  }
  
  // REMOVE LATER
  public void keyRelease(char key_) {
    if(key_ == '1') {
      HashMap<String, Integer> inv = player.getInventory();
      inv.put("DIAMOND", inv.get("DIAMOND")+100);
      inv.put("URANIUM", inv.get("URANIUM")+100);
      inv.put("TITANIUM", inv.get("TITANIUM")+100);
    }
  }
}
