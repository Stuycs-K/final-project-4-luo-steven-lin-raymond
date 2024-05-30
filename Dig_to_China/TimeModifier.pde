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
  
}
