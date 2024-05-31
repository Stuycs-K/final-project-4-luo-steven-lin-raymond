public class Button {
  private String text = "";
  private int x, y, w, h;
  private color defaultTextColor = color(0);
  private color defaultBgColor = color(255);
  private color hover1TextColor = color(255);
  private color hover1BgColor = color(255, 0, 0);
  private color hover2TextColor = color(0);
  private color hover2BgColor = color(0, 255, 0);
  private color pressedTextColor = color(255);
  private color pressedBgColor = color(0);
  private boolean isPressed = false;
  
  public Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  //public Button(int x, int y, int w, int h, String name) {
  //  this(x, y, w, h);
  //  this.text = name;
  //}
  
  //public Button(int x, int y, int w, int h, color defaultTextColor, color defaultBgColor) {
  //  this(x, y, w, h);
  //  this.defaultTextColor = defaultTextColor;
  //  this.defaultBgColor = defaultBgColor;
  //}
  
  //public Button(int x, int y, int w, int h, color defaultTextColor, color defaultBgColor, String name) {
  //  this(x, y, w, h, defaultTextColor, defaultBgColor);
  //  this.text = name;
  //}
  
  public void display() {
    if(isPressed){
      fill(pressedBgColor);
    }
    else if(isMouseOver(mouseX, mouseY)) {
      if(fulfilled()) {
        fill(hover2BgColor);
      }
      else {
        fill(hover1BgColor);
      }
    }
    else {
      fill(defaultBgColor);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    
    if(isPressed){
      fill(pressedTextColor);
    }
    else if(isMouseOver(mouseX, mouseY)) {
      if(fulfilled()) {
        fill(hover2TextColor);
      }
      else {
        fill(hover1TextColor);
      }
    }
    else {
      fill(defaultTextColor);
    }
    textSize(20);
    text(text, x, y);
  }
  
  public void press(){
    isPressed = true;
  }
  
  public void release() {
    isPressed = false;
  }
  
  public boolean isMouseOver(int mx, int my){
    return mx > x - w / 2 && mx < x + w / 2 && my > y - h / 2 && my < y + h / 2;
  }
  
  public boolean isPressed() {
    return isPressed;
  }
  
  private boolean fulfilled() {
    return false;
  }
}
