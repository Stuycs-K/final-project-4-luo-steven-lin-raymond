public class Level {
  int size = 40;
  
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
    
    //for(int[] x : map) {
    //  println(Arrays.toString(x));
    //}
  }
  
  public void display() {
    background(0);
    rectMode(CORNER);
    int factor = width / size;
    int tile;
    for(int i = 0; i < size; i++) {
      for(int j = 0; j < size; j++) {
        tile = map.get(i)[j];
        if(tile == SKY) {
          fill(0, 200, 255);
        }
        else if(tile == DIRT) {
          fill(0, 100, 0);
        }
        else if(tile == DIAMOND) {
          fill(0, 250, 250);
        }
        else if(tile == URANIUM) {
          fill(0, 255, 0);
        }
        else if(tile == TITANIUM) {
          fill(100, 100, 100);
        }
        else if(tile == TIME) {
          fill(255);
        }
        else fill(0);
        rect(j*factor, i*factor, factor, factor);
      }
    }
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
