public class Customer {
  int x = 10;
  int spot, activationTime;
  PImage spriteHappy, spriteSad;
  boolean active, happy;
  
  Customer(String name) {
    spriteHappy = loadImage(name + "Happy.png");
    spriteSad = loadImage(name + "Sad.png");
  }
  
  void display() {
    if (active) {
      if (happy) {
        image(spriteHappy, x, 450);
      } else {
        image(spriteSad, x, 450);
      }
    }
  }
  
  boolean isActive() {
    return active;
  }
  
  void activate(int n) {
    x = n;
    activationTime= millis() / 1000;
    active = true;
    happy = true;
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
  
  int getActivationTime() {
    return activationTime;
  }
}
