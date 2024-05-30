public class TimeModifier extends Item {
  
  public TimeModifier() {
    super(0, new int[] {100, 200, 300});
  }
  
  public void action(int amount) {
    timer.setMaxTime(timer.getMaxTime() + amount);
  }
  
}
