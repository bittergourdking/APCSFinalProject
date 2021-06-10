public class Player {
  String selected = "";
  String typeSelected = "";
  
  Player() {
    
  }
  
  void display() {
    fill(#ffd275);
  }
  
  void selectTool(Tool t) {
    selected = t.getType();
    typeSelected = "tool";
  }
  
  void selectIngredient(Ingredient item) {
    selected = item.getType();
    typeSelected = "ingredient";
  }
  
  void deselect() {
    selected = typeSelected = "";
  }
  
  String getSelected() {
    return selected;
  }
  
  String getTypeSelected() {
    return typeSelected;
  }
  
  void useTool(Ingredient ingredient) {
    if (ingredient.getGrowthStage() == 0) {
      if (selected.equals("creation egg")) {
        ingredient.sow();
        deselect();
        tools[0].click();
      }
    } else if (ingredient.getGrowthStage() == 3) {
      if (selected.equals("basket")) {
        ingredient.harvest();
        deselect();
        tools[4].click();
      }
    } else {
      if (selected.equals("food bag")) {
        ingredient.updateNutrient();
        deselect();
        tools[1].click();
      } else if (selected.equals("watering can")) {
        ingredient.updateWater();
        deselect();
        tools[2].click();
      } else if (selected.equals("hoe")) {
        ingredient.updateWeed();
        deselect();
        tools[3].click();
      }
    }
  }
  
}
