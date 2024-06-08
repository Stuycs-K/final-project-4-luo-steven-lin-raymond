public class Mole {
  int x = 0;
  int y = 0;
  int start;
  
  public Mole(int x, int y) {
    this.x = x;
    this.y = y+1;
    start = millis();
  }
  
  public void run() {
    for(int i = 0; i < 100; i++) {
      double chance = Math.random();
      if(chance < 1.0/9) {
        move(1, 0);
      }
      else if(chance < 5.0/9) {
        move(0, -1);
      }
      else {
        move(0, 1);
      }
    }
    level.map.get(y)[x] = level.SKY;
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
