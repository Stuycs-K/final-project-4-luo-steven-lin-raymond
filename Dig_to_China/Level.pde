public class Level {
  public final int SIZE = 40;
  
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
  private int pastTime = millis();
  private Bomb bomb = new Bomb();
  
  public Level() {
    inputs = new boolean[6];
    int[] row;
    for(int i = 0; i < SIZE/2; i++) {
      row = new int[SIZE];
      Arrays.fill(row, SKY);
      map.add(row);
    }
    map.getLast()[SIZE/2] = PLAYER;
    
    row = new int[SIZE];
    Arrays.fill(row, DIRT);
    map.add(row);
    
    for(int i = SIZE/2+1; i < SIZE; i++) {
      row = generateRow();
      map.add(row);
    }
    
    //for(int[] x : map) {
    //  println(Arrays.toString(x));
    //}
  }
  
  public int[] generateRow() {
    int[] row = new int[SIZE];
    double chance;
    for(int j = 0; j < row.length; j++) {
      chance = Math.random();
      if(chance < 0.95) {
        row[j] = STONE;
      }
      else if(chance < 0.97) {
        row[j] = DIAMOND;
      }
      else if(chance < 0.98) {
        row[j] = URANIUM;
      }
      else if(chance < 0.99) {
        row[j] = TITANIUM;
      }
      else {
        row[j] = TIME;
      }
    }
    return row;
  }
  
  public void display() {
    if(!timer.isPositive()) {
      reset();
    }
    
    background(0);
    rectMode(CORNER);
    int factor = width / SIZE;
    int tile;
    for(int i = 0; i < SIZE; i++) {
      for(int j = 0; j < SIZE; j++) {
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
    
    int current = millis();
    if(current - pastTime >= 1000) {
      //println("TICK");
      timer.tick();
      pastTime = current;
    }
  }
  
  public boolean[] getInputs() {
    return inputs;
  }
  
  public void press(int key_, boolean keyCoded) {
    if(keyCoded) {
      if (key_ == UP) {
        inputs[0] = true;
      }
      if (key_ == LEFT) {
        inputs[1] = true;
      }
      if (key_ == DOWN) {
        inputs[2] = true;
      }
      if (key_ == RIGHT) {
        inputs[3] = true;
      }
    }
    else {
      if (key_ == 'w' || key_ == 'W') {
        inputs[0] = true;
      }
      if (key_ == 'a' || key_ == 'A') {
        inputs[1] = true;
      }
      if (key_ == 's' || key_ == 'S') {
        inputs[2] = true;
      }
      if (key_ == 'd' || key_ == 'D') {
        inputs[3] = true;
      }
      if (key_ == 'b' || key_ == 'B') {
        inputs[4] = true;
      }
    }
  }
  
  public void release(int key_, boolean keyCoded) {
    if(keyCoded) {
      if (key_ == UP) {
        inputs[0] = false;
      }
      if (key_ == LEFT) {
        inputs[1] = false;
      }
      if (key_ == DOWN) {
        inputs[2] = false;
      }
      if (key_ == RIGHT) {
        inputs[3] = false;
      }
    }
    else {
      if (key_ == 'w' || key_ == 'W') {
        inputs[0] = false;
      }
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
  }
  
  public void keyAction() {
    if (inputs[0]) {
      dig(player.getX(), player.getY()-1);
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
    if (inputs[4]) {
      bomb.use();
      inputs[4] = false;
    }
  }
  
  public void dig(int newX, int newY) {
    if(newX < 0 || newX >= 40 || newY < 0 || newY >= 40) {
      return;
    } 
    
    if(map.get(newY)[newX] == PLAYER) {
       return;
    }
    if(map.get(newY)[newX] == DIAMOND) {
      player.addOre("DIAMOND");
      //println("DIAMOND");
    }
    if(map.get(newY)[newX] == URANIUM) {
      player.addOre("URANIUM");
      //println("URANIUM");
    }
    if(map.get(newY)[newX] == TITANIUM) {
      player.addOre("TITANIUM");
      //println("TITANIUM");
    }
    if(map.get(newY)[newX] == TIME) {
      //println("TIME");
      timer.addTime(3);
    }
    map.get(newY)[newX] = SKY;
  }
  
  private void movePlayer(int dy, int dx){
    int newX = player.getX() + dx;
    int newY = player.getY() + dy;
    
    if (newX >= 0 && newX < SIZE && newY >= 0 && newY < SIZE){
      if (map.get(newY)[newX] != SKY){
        dig(newX, newY);
      }
      //else{
        map.get(player.getY())[player.getX()] = SKY;
        player.setX(newX);
        player.setY(newY);
        map.get(newY)[newX] = PLAYER;
      //}
      if(dy == 1) {
        player.addDepth();
        //println(player.getDepth());
      }
    }
    else {
      generate();
    } 
  }
  
  private void generate() {
    int[] newLevel = new int[SIZE];
    for(int i = 0; i < SIZE/2; i++) {
      map.removeFirst();
      newLevel = generateRow();
      map.add(newLevel);
    }
    player.setY(SIZE/2-1);
  }
  
  
}
