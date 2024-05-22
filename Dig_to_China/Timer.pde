public class Timer {
  private int time;
  
  Timer(int time) {
    this.time = time;
  }
  
  Timer() {
    this(60);
  }
  
  public boolean isPositive() {
    return time > 0;
  }
  
  public void display() {
    text("TIMER DISPLAYED", 100, 100);
  }
  
  private void tick() {
  }
  
  public void setTime(int time) {
    this.time = time;
  }
  
  public int getTime() {
    return time;
  }
}
