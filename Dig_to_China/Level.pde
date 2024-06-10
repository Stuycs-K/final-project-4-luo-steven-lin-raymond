public class Level {
  private static final int WIN_DEPTH = 600;
  public final int SIZE = 40;
  
  private LinkedList<int[]> map = new LinkedList<>();
  private final int SKY = 0;
  private final int DIRT = 1;
  private final int DIAMOND = 2;
  private final int URANIUM = 3;
  private final int TITANIUM = 4;
  private final int TIME = 5;
  private final int STONE = 6;
  private final int MOLE = 9998;
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
      else if(chance < 0.985) {
        row[j] = URANIUM;
      }
      else if(chance < 0.995) {
        row[j] = TITANIUM;
      }
      else {
        chance = Math.random();
        if(chance < 0.5 && player != null && player.depth >= 150) {
          row[j] = MOLE;
        }
        else {
          row[j] = TIME;
        }
      }
    }
    return row;
  }
  
  public void display() {
    if(!timer.isPositive()) {
      reset();
    }
    
    textAlign(LEFT);
    background(0);
    rectMode(CORNER);
    int factor = height / SIZE;
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
        else if(tile == MOLE) {
          fill(255, 0, 0);
        }
        else if(tile == PLAYER) {
          fill(0);
        }
        else fill(0);
        rect(j*factor, i*factor, factor, factor);
      }
    }
    timer.display();
    
    bomb.display();
    
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
      if (key_ == 'q' || key_ == 'Q') {
        inputs[5] = true;
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
    if (inputs[5]) {
      reset();
      inputs[5] = false;
    }
  }
  
  public void dig(int newX, int newY) {
      if (newX < 0 || newX >= SIZE || newY < 0 || newY >= SIZE) {
          return;
      }

      int range = player.range; 
      int halfRange = range / 2; 
      int startX = newX - halfRange;
      int startY = newY - halfRange;
      int endX = newX + halfRange;
      int endY = newY + halfRange;
      startX = Math.max(0, startX);
      startY = Math.max(0, startY);
      endX = Math.min(SIZE - 1, endX);
      endY = Math.min(SIZE - 1, endY);

      int maxClearedY = newY;
      for (int y = startY; y <= endY; y++) {
          for (int x = startX; x <= endX; x++) {
              if (map.get(y)[x] == DIAMOND) {
                  player.addOre("DIAMOND");
              } else if (map.get(y)[x] == URANIUM) {
                  player.addOre("URANIUM");
              } else if (map.get(y)[x] == TITANIUM) {
                  player.addOre("TITANIUM");
              } else if (map.get(y)[x] == TIME) {
                  timer.addTime(3);
              }
              map.get(y)[x] = SKY;
              maxClearedY = Math.max(maxClearedY, y);
          }
      }
      if (maxClearedY != newY) {
          player.setY(maxClearedY);
      }
  }
  
  private void movePlayer(int dy, int dx){
    int newX = player.getX() + dx;
    int newY = player.getY() + dy;
    
    if (newX >= 0 && newX < SIZE && newY >= 0 && newY < SIZE - 5){
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
        if (player.getDepth() >= WIN_DEPTH){
          endGame();
          return;
        //println(player.getDepth());
        }
      }
    }
    else if (newY >= SIZE - 5) {
      generate();
    } 
  }
  
  private void endGame(){
    game = false;
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text("You've Reached China!", width / 2, height / 2);
    delay(3000);
    reset();
  }
  
  private void generate() {
    for(int i = 0; i < SIZE/2; i++) {
      map.removeFirst();
      map.add(generateRow());
      player.setY(player.getY()-1);
    }
  }
}
