/* public class Bomb extends Item{
  public Bomb(){
    super(0, 0, 0, new int[] {100, 200, 300});
    modifyName("Bomb");
  }
  
  public void use(){
    int playerX = player.getX();
    int playerY = player.getY();
    int size = level.SIZE;
    for (int i = Math.max(0, playerY - 2); i <= Math.min(size, playerY + 2); i++){
      for (int j = Math.max(0, playerX - 2); j <= Math.min(size, playerX + 2); j++){
        level.dig(j, i);
      }
    }
    level.movePlayer(2, 0);
  }
}
*/
