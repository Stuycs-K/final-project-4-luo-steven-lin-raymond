public class Player {
  private int[] coords;
  private int range;
  
  public Player() {
    coords = new int[] {level.size/2, level.size/2};
    range = 3;
  }
  
  public int[] getCoords() {
    return coords;
  }
  
  public void updatePosition(int dr, int dc) {
    coords[0] += dr;
    coords[1] += dc;
  }
  
  public int getRange() {
    return range;
  }
  
  public void setRange(int r) {
    range = r;
  }
  
}
