public class Timer {
  private int time;
  private int startTime;
  private int maxTime;
  
  private int pastTime;
  
  public Timer(int time, int maxTime) {
    this.time = time;
    startTime = time;
    this.maxTime = maxTime;
    pastTime = millis();
  }
  
  public Timer() {
    this(5, 10);
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
  
  public void reset() {
    time = startTime;
  }
  
  public void tick() {
    int current = millis();
    if(current - pastTime >= 1000) {
      time--;
      pastTime = current;
    }
  }
  
  public void addTime(int dt) {
    if(time + dt > maxTime) {
      time = maxTime;
    } else {
      time += dt;
    }
  }
  
  public void addStartTime(int dt) {
    if(startTime + dt > maxTime) {
      startTime = maxTime;
    } else {
      startTime += dt;
    }
  }
  
  public int getTime() {
    return time;
  }
  
  public int getMaxTime() {
    return maxTime;
  }
  
  public void setMaxTime(int mTime) {
    if(mTime <= 50) {
      maxTime = mTime;
    }
  }
  
}
