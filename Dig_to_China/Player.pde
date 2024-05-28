import java.util.HashMap;

public class Player {
  private int x, y;
  private int range;
  private int depth;
  private HashMap<String, Integer> inventory;
  
  public Player() {
    range = 3;
    x = level.size/2;
    y = level.size/2-1;
    initializeInventory();
  }
  
  private void initializeInventory(){
    inventory = new HashMap<>();
    inventory.put("DIAMOND", 0);
    inventory.put("URANIUM", 0);
    inventory.put("TITANIUM", 0);
  }
  
  public void reset() {
    x = level.size/2;
    y = level.size/2-1;
    println(inventory);
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
  
  public void addDepth() {
    depth++;
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
