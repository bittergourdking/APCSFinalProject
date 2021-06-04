public class Ingredient {
  int inventory, nutrient, water, weed, growthStage, x, y;
  String name;
  PImage[] stages = new PImage[4];
  boolean selected;
  
  Ingredient(String s, int xC, int yC) {
    name = s;
    x = xC;
    y = yC;
    inventory = 2;
    stages[0] = loadImage("blankIngredient.png");
    for (int i = 1; i < 4; i++) {
      stages[i] = loadImage(s + i + ".png");
    }
  }
  
  void display() {
    image(stages[growthStage], x, y);
  }
  
  void update() {
    nutrient -= 2;
    water -= 2;
    weed -= 10;
  }
  
  void updateNutrient() {
    nutrient += 30;
  }
  
  void updateWater() {
    water += 30;
  }
  
  void updateWeed() {
    weed = 100;
  }
  
  void sow() {
    if (growthStage == 0) {
      growthStage = 1;
    }
  }
  
  void harvest() {
    inventory += 2 * ((nutrient + water + weed) / 100);
    if (inventory > 99) {
      inventory = 99;
    }
  }

}
