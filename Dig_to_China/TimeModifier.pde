public class TimeModifier {
  
  private Button start;
  private Button max;
  
  public TimeModifier() {
    start = new Button(width/2 - 200, height - 200, 300, 50);
    start.text = "+3 seconds to start\nCost: 4 DIAMONDS";
    
    max = new Button(width/2 + 200, height - 200, 300, 50);
    max.text = "+3 seconds to max\nCost: 10 DIAMONDS, 2 URANIUM";
  }
  
  public void display() {
    start.display();
    max.display();
    
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
  }
  
  public void press() {
    if(start.isMouseOver(mouseX, mouseY)) {
      start.press();
    }
    if(max.isMouseOver(mouseX, mouseY)) {
      max.press();
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
  
  public boolean fulfilledStart() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 4;
  }
  
  public boolean fulfilledMax() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 10 && inv.get("URANIUM") >= 2;
  }
  
}
