public class Bomb extends Item{
  public Bomb(){
    super(0, 0, 0, new int[] {100, 200, 300});
    modifyName("Bomb");
  }
  
  public void use(Player player, LinkedList<int[]> map){
    int playerX = player.getX();
    int playerY = player.getY();
    int size = map.size();
    for (int i = Math.max(0, playerY - 2); i < Math.min(size, playerY + 2); i++){
      for (int j = Math.max(0, playerX - 2); j < Math.min(size, playerX + 2); j++){
        map.get(i)[j] = 0;
      }
    }
  }
}
      
