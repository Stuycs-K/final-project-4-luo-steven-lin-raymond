public class Mole {
  private int x = 0;
  private int y = 0;
  private boolean active;
  
  public Mole() {
    active = false;
  }
  
  public void run(int x, int y) {
    this.x = x;
    this.y = y+1;
    active = true;
    level.map.get(y)[x] = level.SKY;
    for(int i = 0; i < 100; i++) {
      double chance = Math.random();
      if(chance < 1.0/9) {
        move(-1, 0);
      }
      else if(chance < 5.0/9) {
        move(0, -1);
      }
      else {
        move(0, 1);
      }
    }
    level.map.get(y)[x] = level.SKY;
    active = false;
  }
  
  private boolean move(int dy, int dx){
    int newX = x + dx;
    int newY = y + dy;
    
    if (newX >= 0 && newX < level.SIZE && newY >= 0 && newY < level.SIZE - 5){
      if (level.map.get(newY)[newX] != level.SKY){
        dig(newX, newY);
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
  
  public void dig(int newX, int newY) {
    if (newX < 0 || newX >= level.SIZE || newY < 0 || newY >= level.SIZE) {
        return;
    }
    
    LinkedList<int[]> map = level.map;
    if (map.get(y)[x] == level.DIAMOND) {
      player.addOre("DIAMOND");
    } else if (map.get(y)[x] == level.URANIUM) {
      player.addOre("URANIUM");
    } else if (map.get(y)[x] == level.TITANIUM) {
      player.addOre("TITANIUM");
    } else if (map.get(y)[x] == level.TIME) {
      timer.addTime(3);
    }
    map.get(y)[x] = level.SKY;
  }
}
