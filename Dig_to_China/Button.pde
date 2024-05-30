public class Button {
  private String text = "";
  private int x, y, w, h;
  private color textColor = color(0);
  private color bgColor = color(255);
  private color altTextColor = color(0);
  private color altBgColor = color(0, 255, 0);
  private boolean isPressed = false;
  
  public Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void setText(String text) {
    this.text = text;
  }
  
  public void setBgColor(color bgColor, color altBgColor) {
    this.bgColor = bgColor;
    this.altBgColor = altBgColor;
  }
  
  public void setTextColor(color textColor, color altTextColor) {
    this.textColor = textColor;
    this.altTextColor = altTextColor;
  }
  
  //public Button(int x, int y, int w, int h, String name) {
  //  this(x, y, w, h);
  //  this.text = name;
  //}
  
  //public Button(int x, int y, int w, int h, color textColor, color bgColor) {
  //  this(x, y, w, h);
  //  this.textColor = textColor;
  //  this.bgColor = bgColor;
  //}
  
  //public Button(int x, int y, int w, int h, color textColor, color bgColor, String name) {
  //  this(x, y, w, h, textColor, bgColor);
  //  this.text = name;
  //}
  
  public void display() {
    if(isPressed){
      fill(altBgColor);
    } else {
      fill(bgColor);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    
    if(isPressed){
      fill(altTextColor);
    } else {
      fill(textColor);
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
}
