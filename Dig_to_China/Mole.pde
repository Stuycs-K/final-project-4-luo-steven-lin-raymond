public class Mole {
  int x = 0;
  int y = 0;
  int start;
  
  public Mole(int x, int y) {
    this.x = x;
    this.y = y+1;
    start = millis();
    run();
  }
  
  private void run() {
    for(int i = 0; i < 2000; i++) {
      double chance = Math.random();
      if(chance < 1.0/3) {
        move(1, 0);
      }
      else if(chance < 2.0/3) {
        move(0, -1);
      }
      else {
        move(0, 1);
      }
    }
  }
  
  private boolean move(int dy, int dx){
    int newX = x + dx;
    int newY = y + dy;
    
    if (newX >= 0 && newX < level.SIZE && newY >= 0 && newY < level.SIZE){
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
