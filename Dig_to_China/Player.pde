public class Player {
  private int x, y;
  private int range;
  private int depth, prevDepth, maxDepth;
  private HashMap<String, Integer> inventory;
  
 public Player() {
    range = 0;
    x = level.SIZE/2;
    y = level.SIZE/2-1;
    initializeInventory();
  }
  
  private void initializeInventory(){
    inventory = new HashMap<>();
    inventory.put("DIAMOND", 0);
    inventory.put("URANIUM", 0);
    inventory.put("TITANIUM", 0);
    inventory.put("TIME", 0);
    inventory.put("BOMB", 1);
  }
  
  public void reset() {
    x = level.SIZE/2;
    y = level.SIZE/2-1;
    maxDepth = Math.max(depth, maxDepth);
    prevDepth = depth;
    depth = 0;
    //println(inventory);
    //inventory.clear();
    //initializeInventory();
  }
  
  public int getX() {
    return x;
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public int getY() {
    return y;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public int getRange() {
    return range;
  }
  
  public void setRange(int r) {
    range = r;
  }
  
  public int getDepth() {
    return depth;
  }
  
  public void addDepth(int dy) {
    depth += dy;
  }
  
  public int getMaxDepth() {
    return maxDepth;
  }
  
  public int getPrevDepth() {
    return prevDepth;
  }
 
  public void addOre(String oreType){
    if (inventory.containsKey(oreType)){
      inventory.put(oreType, inventory.get(oreType) + 1);
    }
  }
  
  public HashMap<String, Integer> getInventory(){
    return inventory;
  }
  
}
