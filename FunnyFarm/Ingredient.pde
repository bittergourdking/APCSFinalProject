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
    nutrient = water = weed = 50;
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
  
  boolean isGrowing() {
    return (growthStage > 0 && growthStage < 3);
  }
  
  void display() {
    fill(#532106);
    textSize(30);
    //rotate?
    text(inventory, x - 60, y + 80);
    if (selected) {
      tint(#ff006a, 126);
    }
    image(stages[growthStage], x, y);
    noTint();
    if (isGrowing()) {
      update();
      textSize(10);
      //change x, y
      text(nutrient + "\n" + water + "\n" + weed, x + 20, y + 14);
    }
    growingTime = millis() / 1000 - startTime;
  }
  
  //rates can be changed in future for fun, challenging, but not impossible gameplay;
  void update() {
    if (nutrient > 0 && Math.random() > .95) {
      nutrient -= 1;
    }
    if (water > 0 && Math.random() > .95) {
      water -= 1;
    }
    if (weed > 0 && Math.random() > .95) {
      weed -= 1;
    }
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
    inventory += 2 * ((nutrient + water + weed) / 50);
    if (inventory > 99) {
      inventory = 99;
    }
    growthStage = 0;
    nutrient = water = weed = 50;
  }
  
  void click() {
    if (selected == false) {
      selected = true;
    } else {
      selected = false;
    }
  }

}
