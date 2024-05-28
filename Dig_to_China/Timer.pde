public class Timer {
  private int time;
  private int maxTime;
  
  public Timer(int time, int maxTime) {
    this.time = time;
    this.maxTime = maxTime;
  }
  
  public Timer() {
    this(5, 30);
  }
  
  public boolean isPositive() {
    return time > 0;
  }
  
  public void display() {
    int factor = 10;
    fill(200);
    rect(50, 50, maxTime * factor, 25);
    
    if(time < maxTime * 0.25) {
      fill(255, 0, 0);
    }
    else if(time <= maxTime * 0.5) {
      fill(255, 255, 0);
    }
    else {
      fill(0, 255, 0);
    }
    rect(50, 50, time * factor, 25);
  }
  
  public void tick() {
    time--;
  }
  
  public void addTime(int dt) {
    if(time + dt > maxTime) {
      time = maxTime;
    } else {
      time += dt;
    }
  }
  
  public int getTime() {
    return time;
  }
  
  public void setMaxTime(int mTime) {
    maxTime = mTime;
  }
  
}
