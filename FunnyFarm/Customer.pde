public class Customer {
  int x = 10;
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
  
  void activate(int n) {
    x = n;
    active = true;
  }
  
  void deactivate() {
    active = false;
  }
}
