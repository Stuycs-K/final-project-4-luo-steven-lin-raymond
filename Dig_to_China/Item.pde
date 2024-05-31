// WARNING: THIS CLASS IS ABOUT TO BE DEPRECATED.

public class Item {
  private String name;
  private int frequency;
  private int[] prices;
  
  public Item(int freq, int[] prices) {
    frequency = freq;
    this.prices = prices;
  }
  
  public String toString() {
    return name;
  }
  
  public void modifyName(String n) {
    name = n;
  }
  
  public int getFrequency() {
    return frequency;
  }
  
  public void setFrequency(int freq) {
    frequency = freq;
  }
}
