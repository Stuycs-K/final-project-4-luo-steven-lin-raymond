public class TimeModifier extends Item {
  
  public TimeModifier() {
    super(0, new int[] {100, 200, 300});
  }
  
  public void extendMaxTime(int amount) {
    timer.setMaxTime(timer.getMaxTime() + amount);
  }
  
  public void extendStartingTime(int amount) {
    timer.addTime(amount);
  }
  
  public boolean fulfilledStart() {
    HashMap<String, Integer> inv = player.getInventory();
    return inv.get("DIAMOND") >= 4;
  }
  
  public void fulfillStart() {
    HashMap<String, Integer> inv = player.getInventory();
    inv.put("DIAMOND", inv.get("DIAMOND")-4);
  }
  
  public boolean fulfilledMax() {
    return true;
  }
  
}
