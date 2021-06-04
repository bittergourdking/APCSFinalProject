public class Ingredient {
  int inventory, nutrient, water, weed, growthStage, x, y;
  String type;
  PImage[] stages = new PImage[4];
  boolean selected;
  
  Ingredient(String s, int xC, int yC) {
    type = s;
    x = xC;
    y = yC;
    inventory = 2;
    nutrient = water = weed = 30;
    stages[0] = loadImage("blankIngredient.png");
    for (int i = 1; i < 4; i++) {
      stages[i] = loadImage(s + i + ".png");
    }
  }
  
  String getType() {
    return type;
  }
  
  int getGrowthStage() {
    return growthStage;
  }
  
  boolean growing() {
    return (growthStage > 0 && growthStage < 3);
  }
  
  void display() {
    if (selected) {
      tint(#ffaaaf, 126);
    }
    image(stages[growthStage], x, y);
    if (growing()) {
      update();
      fill(0);
      textSize(10);
      text(inventory, x, y);
    }
  }
  
  void update() {
    nutrient -= 2;
    water -= 2;
    weed -= 10;
  }
  
  void updateNutrient() {
    nutrient += 30;
    if (nutrient > 100) {
      nutrient = 100;
    }
  }
  
  void updateWater() {
    water += 30;
    if (water > 100) {
      water = 100;
    }
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
    nutrient = water = weed = 0;
    inventory += 2 * ((nutrient + water + weed) / 100);
    if (inventory > 99) {
      inventory = 99;
    }
  }
  
  void click() {
    if (selected == false) {
      selected = true;
    } else {
      selected = false;
    }
  }

}
