public class Player {
  private int x, y;
  private int range;
  private int depth;
  
  public Player() {
    reset();
    range = 3;
  }
  
  public void reset() {
    x = level.size/2;
    y = level.size/2-1;
  }
  
  public int getX() {
    return x;
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public int getY() {
    return y;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public int getRange() {
    return range;
  }
  
  public void setRange(int r) {
    range = r;
  }
  
  public int getDepth() {
    return depth;
  }
  
  public void addDepth() {
    depth++;
  }
  
}
