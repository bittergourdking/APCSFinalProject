public class Ingredient {
  int inventory, nutrient, water, weed, growthStage, x, y, startTime, growingTime;
  String type;
  PImage[] stages = new PImage[4];
  boolean selected;
  
  Ingredient(String s, int xC, int yC) {
    type = s;
    x = xC;
    y = yC;
    inventory = 2;
    nutrient = water = weed = 30;
    startTime = millis() / 1000;
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
    fill(#532106);
    textSize(30);
    //rotate?
    text(inventory, x - 60, y + 80);
    if (selected) {
      tint(#ffaaaf, 126);
    }
    image(stages[growthStage], x, y);
    noTint();
    if (growing()) {
      update();
      textSize(10);
      //change x, y
      text(nutrient + "\n" + water + "\n" + weed, x + 20, y + 10);
    }
    growingTime = millis() / 1000 - startTime;
  }
  
  void update() {
    nutrient -= 2;
    water -= 2;
    weed -= 10;
    if (growingTime == 15) {
      growthStage = 2;
    } else if (growingTime == 30) {
      growthStage = 3;
    }
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
      startTime = millis() / 1000;
    }
  }
  
  void harvest() {
    nutrient = water = weed = 30;
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
