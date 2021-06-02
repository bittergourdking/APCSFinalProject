public class Player {
  int money, time, customersActive;
  String selected;
  boolean caught;
  
  void getTool(Tool t) {
    selected = t.getType();
  }
  
  void useFarmTool(Ingredient ingredient) {
    if (selected.equals("watering can")) {
      ingredient.updateWater();
      selected = "";
    } else if (selected.equals("food bag")) {
      ingredient.updateNutrient();
      selected = "";
    } else if (selected.equals("hoe")) {
      ingredient.updateWeed();
      selected = "";
    } else if (selected.equals("basket")) {
      ingredient.harvest();
      selected = "";
    } else if (selected.equals("seed bag")) {
      ingredient.sow();
      selected = "";
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
