public class Detective {
  boolean active;
  int x;
  PImage sprite = loadImage("Yves.png");
  
  Detective() {
    
  }
  
  void display() {
    image(sprite, x, 450);
  }
  
  boolean isActive() {
    return active;
  }
  
  void makeActive() {
    active = true;
  }
  
}
