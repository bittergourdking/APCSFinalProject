public class Ingredient {
  int inventory, sunlight, water, weed, growthStage;
  
  Ingredient() {
  }
  
  void update() {
    sunlight -= 2;
    water -= 2;
    weed -= 10;
  }
  
  void updateSun() {
    sunlight += 30;
  }
  
  void updateWater() {
    water += 30;
  }
  
  void updateWeed() {
    weed += 100;
  }

}
