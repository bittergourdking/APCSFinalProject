public class Customer {
  int x;
  PImage spriteHappy, spriteSad;
  
  Customer(String name) {
    spriteHappy = loadImage(name + "Happy.png");
    spriteSad = loadImage(name + "Sad.png");
  }
}
