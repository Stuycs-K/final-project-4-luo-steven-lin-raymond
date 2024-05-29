public class Bomb extends Item{
  public Bomb(){
    super();
    this.name = "Bomb";
    this.rangeChange = 0;
    this.timeChange = 0;
    this.frequency = 0;
    this.prices = new int[]{100, 200, 300  };
  }
  
  public void use(Player player, LinkedList<int[]> map){
    int playerX = player.getX();
    int playerY = player.getY();
    int size = map.size();
    for (int i = Math.max(0, playerY - 2); i < Math.min(size, playerY + 2); i++){
      for (int i = Math.max(0, playerX - 2); i < Math.min(size, playerX + 2); i++){
        map.get(i)[j] = 0;
      }
    }
  }
}
      
