public class Timer {
  private int time;
  
  public Timer(int time) {
    this.time = time;
  }
  
  public Timer() {
    this(5);
  }
  
  public boolean isPositive() {
    return time > 0;
  }
  
  public void display() {
    fill(255);
    text(time, 100, 100);
  }
  
  public void tick() {
    time--;
  }
  
  public void setTime(int time) {
    this.time = time;
  }
  
  public int getTime() {
    return time;
  }
}
