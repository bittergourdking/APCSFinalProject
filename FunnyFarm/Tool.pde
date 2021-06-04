public class Tool {
  String type;
  int x, y;
  PImage sprite;
  boolean selected;
  
  Tool(String s, int xC, int yC) {
    type = s;
    x = xC;
    y = yC;
    sprite = loadImage(s + ".png");
  }
  
  void display() {
    if (selected) {
      tint(#ffaaaf, 126);
    }
    image(sprite, x, y);
    noTint();
  }
  
  String getType() {
    return type;
  }
  
  void click() {
    if (selected == false) {
      selected = true;
    } else {
      selected = false;
    }
  }

}
