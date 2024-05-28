public class Item {
  protected String name;
  private int rangeChange, timeChange;
  private int frequency;
  private int[] prices;
  
  public Item() { // parameters later
  }
  
  public String toString() {
    return name;
  }
  
  public int getRangeChange() {
    return rangeChange;
  }
  
  public int getTimeChange() {
    return timeChange;
  }
  
  public int getFrequency() {
    return frequency;
  }
  
  public void setFrequency(int freq) {
    frequency = freq;
  }
}
