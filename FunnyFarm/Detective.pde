public class Detective {
  boolean active;
  int spot;
  int x = 10;
  PImage sprite = loadImage("Yves.png");
  
  Detective() {
    
  }
  
  void display() {
    image(sprite, x, 450);
  }
  
  boolean isActive() {
    return active;
  }
  
  void activate(int n) {
    x = n;
    active = true;
  }
  
  void deactivate() {
    active = false;
  }
  
  void setSpot(int n) {
    spot = n;
  }
  
  int getSpot() {
    return spot;
  }
  
}
