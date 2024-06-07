public class Mole {
  int x = 0;
  int y = 0;
  
  public Mole(int x, int y) {
    this.x = x;
    this.y = y;
    int start = millis();
    while((millis() - start) % 500 == 0 && (millis() - start <= 2000)) {
      run();
    }
  }
  
  private void run() {
    double chance = Math.random();
    boolean done = false;
    if(chance < 1.0/3) {
      done = move(1, 0);
    }
    else if(chance < 2.0/3) {
      done = move(0, -1);
    }
    else {
      done = move(0, 1);
    }
  }
  
  private boolean move(int dy, int dx){
    int newX = x + dx;
    int newY = y + dy;
    
    if (newX >= 0 && newX < level.SIZE && newY >= 0 && newY < level.SIZE - 5){
      
      if (level.map.get(newY)[newX] != level.SKY){
        level.dig(newX, newY);
      }
      //else{
        level.map.get(y)[x] = level.SKY;
        x = newX;
        y = newY;
        level.map.get(newY)[newX] = level.MOLE;
      //}
      return true;
    }
    return false;
  }
}
