public class Ingredient {
  int inventory, nutrient, water, weed, growthStage, x, y;
  String name;
  PImage[] stages;
  
  Ingredient(String s, int xC, int yC) {
    name = s;
    x = xC;
    y = yC;
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
    weed += 100;
  }

}
