public class Player {
  int money, time, customersActive;
  String selected = "";
  boolean caught;
  
  Player() {
    time = 600;
  }
  
  void display() {
    fill(#ffd275);
  }
  
  void selectTool(Tool t) {
    selected = t.getType();
  }
  
  void selectIngredient(Ingredient item) {
    selected = item.getType();
  }
  
  String getSelected() {
    return selected;
  }
  
  void useTool(Ingredient ingredient) {
    if (ingredient.getGrowthStage() == 0) {
      if (selected.equals("creation egg")) {
        ingredient.sow();
        selected = "";
        tools[0].click();
      }
    } else if (ingredient.getGrowthStage() == 3) {
      if (selected.equals("basket")) {
        ingredient.harvest();
        selected = "";
        tools[4].click();
      }
    } else {
      if (selected.equals("food bag")) {
        ingredient.updateNutrient();
        selected = "";
        tools[1].click();
      } else if (selected.equals("watering can")) {
        ingredient.updateWater();
        selected = "";
        tools[2].click();
      } else if (selected.equals("hoe")) {
        ingredient.updateWeed();
        selected = "";
        tools[3].click();
      }
    }
  }
  
  void endGame() {
    if (caught) {
      //display losing image
    } else if (money < 250) {
      //display another losing image
    } else {
      //display winning image
    }
  }
  
}
