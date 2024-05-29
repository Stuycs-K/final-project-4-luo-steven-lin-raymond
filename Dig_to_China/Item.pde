public class Item {
  private String name;
  private int rangeChange, timeChange;
  private int frequency;
  private int[] prices;
  
  public Item(int rChange, int tChange, int freq, int[] prices) {
    rangeChange = rChange;
    timeChange = tChange;
    frequency = freq;
    this.prices = prices;
  }
  
  public String toString() {
    return name;
  }
  
  public void modifyName(String n) {
    name = n;
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
