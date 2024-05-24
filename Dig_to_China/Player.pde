public class Player {
  private int[] coords;
  
  public Player() {
    coords = new int[] {level.size/2, level.size/2};
  }
  
  public int[] getCoords() {
    return coords;
  }
  
  public void updatePosition(int dr, int dc) {
    coords[0] += dr;
    coords[1] += dc;
  }
  
}
