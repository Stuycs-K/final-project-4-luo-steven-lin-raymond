public class Level {
  int size = 100;
  
  LinkedList<int[]> map = new LinkedList<>();
  private final int SKY = 0;
  private final int DIRT = 1;
  private final int DIAMOND = 2;
  private final int URANIUM = 3;
  private final int TITANIUM = 4;
  private final int TIME = 5;
  private final int PLAYER = 9999;
  
  
  public Level() {
    int[] row;
    for(int i = 0; i < size/2; i++) {
      row = new int[size];
      Arrays.fill(row, SKY);
      map.add(row);
    }
    
    double chance;
    for(int i = size/2; i < size; i++) {
      row = new int[size];
      for(int j = 0; j < row.length; j++) {
        chance = Math.random();
        if(chance < 0.8) {
          row[j] = DIRT;
        }
        else if(chance < 0.85) {
          row[j] = DIAMOND;
        }
        else if(chance < 0.9) {
          row[j] = URANIUM;
        }
        else if(chance < 0.95) {
          row[j] = TITANIUM;
        }
        else {
          row[j] = TIME;
        }
      }
      map.add(row);
    }
    
    for(int[] x : map) {
      println(Arrays.toString(x));
    }
  }
  
  public void display() {
    background(0);
    timer.display();
  }
  
  public void keyAction(char key_) {
  }
  
  public void mouseAction() {
  }
  
  private void tick() {
  }
  
  public void dig(int x, int y) {
  }
}
