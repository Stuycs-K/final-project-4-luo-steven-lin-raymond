public class Level {
  Timer timer = new Timer();
  Player player = new Player();
  
  LinkedList<int[]> map = new LinkedList<>();
  
  public Level() {
    // generation
  }
  
  public void display() {
    background(0);
    timer.display();
  }
  
  public void action() {
  }
  
  private void tick() {
  }
  
  public void dig(int x, int y) {
  }
}
