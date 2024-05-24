public class Level {
  public final int size = 40;
  
  private LinkedList<int[]> map = new LinkedList<>();
  private final int SKY = 0;
  private final int DIRT = 1;
  private final int DIAMOND = 2;
  private final int URANIUM = 3;
  private final int TITANIUM = 4;
  private final int TIME = 5;
  private final int STONE = 6;
  private final int PLAYER = 9999;
  
  private boolean[] inputs;
  
  
  public Level() {
    inputs = new boolean[6];
    int[] row;
    for(int i = 0; i < size/2; i++) {
      row = new int[size];
      Arrays.fill(row, SKY);
      map.add(row);
    }
    
    map.getLast()[size/2] = PLAYER;
    
    row = new int[size];
    Arrays.fill(row, DIRT);
    map.add(row);
    
    double chance;
    for(int i = size/2+1; i < size; i++) {
      row = new int[size];
      for(int j = 0; j < row.length; j++) {
        chance = Math.random();
        if(chance < 0.95) {
          row[j] = STONE;
        }
        else if(chance < 0.96) {
          row[j] = DIAMOND;
        }
        else if(chance < 0.97) {
          row[j] = URANIUM;
        }
        else if(chance < 0.98) {
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
        else if(tile == STONE) {
          fill(100);
        }
        else if(tile == DIAMOND) {
          fill(0, 250, 250);
        }
        else if(tile == URANIUM) {
          fill(0, 255, 0);
        }
        else if(tile == TITANIUM) {
          fill(50);
        }
        else if(tile == TIME) {
          fill(255);
        }
        else if(tile == PLAYER) {
          fill(0);
        }
        else fill(0);
        rect(j*factor, i*factor, factor, factor);
      }
    }
    timer.display();
  }
  
  public boolean[] getInputs() {
    return inputs;
  }
  
  public void press(char key_) {
    mouseAction();
  }
  
  public void release(char key_) {
  }
  
  private void keyAction() {
  }
  
  public void mouseAction() {
    int[] coords = player.getCoords();
    dig(coords[0], coords[1]);
  }
  
  private void tick() {
  }
  
  public void dig(int x, int y) {
    int range = player.getRange();
    for(int i = y-range/2; i < y+range/2; i++) {
      for(int j = x-range/2; j < x+range/2; j++) {
        map.get(i)[j] = SKY;
      }
    }
    println("RECEIVED");
  }
}
