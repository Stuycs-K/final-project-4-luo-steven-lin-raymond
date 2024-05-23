public class Button {
  private String text = "";
  private int x, y;
  private int w, h;
  private color textColor = color(0);
  private color bgColor = color(255);
  
  public Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public Button(int x, int y, int w, int h, String name) {
    this(x, y, w, h);
    this.text = name;
  }
  
  public Button(int x, int y, int w, int h, color textColor, color bgColor) {
    this(x, y, w, h);
    this.textColor = textColor;
    this.bgColor = bgColor;
  }
  
  public Button(int x, int y, int w, int h, color textColor, color bgColor, String name) {
    this(x, y, w, h, textColor, bgColor);
    this.text = name;
  }
  
  public void display() {
    fill(bgColor);
    rect(x, y, w, h);
    fill(textColor);
    text(text, x, y);
  }
  
  public boolean isPressed() {
    return x-w/2 < mouseX && mouseX < x+w/2 && y-h/2 < mouseY && mouseY < y+h/2;
  }
}
