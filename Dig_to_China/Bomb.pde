public class Bomb {
  
  public void use(){
    HashMap<String, Integer> inv = player.getInventory();
    if(inv.get("BOMB") <= 0) {
      return;
    }
    inv.put("BOMB", inv.get("BOMB")-1);
    int playerX = player.getX();
    int playerY = player.getY();
    int size = level.SIZE;
    for (int i = Math.max(0, playerY - 2); i <= Math.min(size, playerY + 2); i++){
      for (int j = Math.max(0, playerX - 2); j <= Math.min(size, playerX + 2); j++){
        level.dig(j, i);
      }
    }
  }
  
  public void display() {
    HashMap<String, Integer> inv = player.getInventory();
    fill(255);
    rect(width-160, 70, 150, 50);
    fill(255, 0, 0);
    textSize(16);
    text("Number of Bombs: " + inv.get("BOMB"), width-150, 100);
  }
}
