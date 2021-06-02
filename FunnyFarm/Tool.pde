public class Tool {
  String type;
  int x, y;
  PImage sprite;
  
  Tool(String s, int xC, int yC) {
    type = s;
    x = xC;
    y = yC;
    sprite = loadImage(s + ".png");
  }
  
  void display() {
    image(sprite, x, y);
  }
  
  String getType() {
    return type;
  }

}
