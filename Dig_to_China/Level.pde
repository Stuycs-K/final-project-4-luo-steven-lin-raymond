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
  private int playerX;
  private int playerY;
  
  
  public Level() {
    inputs = new boolean[6];
    int[] row;
    for(int i = 0; i < size/2; i++) {
      row = new int[size];
      Arrays.fill(row, SKY);
      map.add(row);
    }
    playerY = size/2 - 1;
    playerX = size/2; 
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
    if (key_ == 'a' || key_ == 'A') {
      inputs[1] = true;
    }
    if (key_ == 's' || key_ == 'S') {
      inputs[2] = true;
    }
    if (key_ == 'd' || key_ == 'D') {
      inputs[3] = true;
    }
  }
  
  public void release(char key_) {
    if (key_ == 'a' || key_ == 'A') {
      inputs[1] = false;
    }
    if (key_ == 's' || key_ == 'S') {
      inputs[2] = false;
    }
    if (key_ == 'd' || key_ == 'D') {
      inputs[3] = false;
    }
  }
  
  private void keyAction() {
    if (inputs[0]){
      movePlayer(-1, 0);
    }
    if (inputs[1]){
      movePlayer(0, -1);
    }
    if (inputs[2]){
      movePlayer(1, 0);
    }
    if (inputs[3]){
      movePlayer(0, 1);
    }
  }
  
  public void mouseAction() {
  }
  
  private void tick() {
    keyAction();
  }
  
  public void dig(int x, int y) {
    int newX = playerX + x;
    int newY = playerY + y;
    if (newX >= 0 && newX < size &&   newY >= 0 && newY < size && map.get(newY)[newX] != SKY){
      map.get(newY)[newX] = SKY;
    }
  }
  
  private void movePlayer(int dy, int dx){
    int newX = playerX + dx;
    int newY = playerY + dy;
    
    
    if (newX >= 0 && newX < size && newY >= 0 && newY < size){
      if (map.get(newY)[newX] != SKY){
        dig(dx, dy);
      }
      else{
        map.get(playerY)[playerX] = SKY;
        playerX = newX;
        playerY = newY;
        map.get(playerY)[playerX] = PLAYER;
      }
    }
  }
}
