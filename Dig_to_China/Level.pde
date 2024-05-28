import java.util.LinkedList;
import java.util.Arrays;

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
  private int pastTime = millis();
  private Player player;
  
  public Level() {
    inputs = new boolean[6];
    player = new Player();
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
    
    for(int i = size/2+1; i < size; i++) {
      row = generateRow();
      map.add(row);
    }
    
    //for(int[] x : map) {
    //  println(Arrays.toString(x));
    //}
  }
  
  public int[] generateRow() {
    int[] row = new int[size];
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
      game = !game;
      reset();
    }
    
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
  
  public void press(char key_) {
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
  }
  
  public void release(char key_) {
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
  
  public void keyAction() {
    if (inputs[0]) {
      dig(0, -1);
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
  
  public void dig(int dx, int dy) {
    int newX = player.getX() + dx;
    int newY = player.getY() + dy;
    //if (newX >= 0 && newX < size &&   newY >= 0 && newY < size && map.get(newY)[newX] != SKY){
    //  map.get(newY)[newX] = SKY;
    //  movePlayer(dy, dx);
    //}
    if(map.get(newY)[newX] == DIAMOND) {
      println("DIAMOND");
    }
    if(map.get(newY)[newX] == URANIUM) {
      println("URANIUM");
    }
    if(map.get(newY)[newX] == TITANIUM) {
      println("TITANIUM");
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
    
    
    if (newX >= 0 && newX < size && newY >= 0 && newY < size){
      if (map.get(newY)[newX] != SKY){
        dig(dx, dy);
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
  
  public void destroyBlock(int y, int x){
    if (map.get(y)[x] != PLAYER){
      map.get(y)[x] = SKY;
    }
  }
  
  private void generate() {
    int[] newLevel = new int[size];
    for(int i = 0; i < size/2; i++) {
      map.removeFirst();
      newLevel = generateRow();
      map.add(newLevel);
    }
    player.setY(size/2-1);
  }
  
  
}
