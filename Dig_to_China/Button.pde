public class Button {
  String text = "";
  int x, y;
  int w, h;
  color textColor = color(255);
  color bgColor = color(0);
  
  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  Button(int x, int y, int w, int h, color textColor, color bgColor) {
    this(x, y, w, h);
    this.textColor = textColor;
    this.bgColor = bgColor;
  }
  
  public void display() {
    fill(bgColor);
    rect(x, y, w, h);
    fill(textColor);
    text(text, x+(w/2), y+(h+2));
  }
  
  public boolean isPressed() {
    return x < mouseX && mouseX < x+w && y < mouseY && mouseY < y+h;
  }
}
