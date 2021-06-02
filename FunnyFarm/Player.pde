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
    } else if (selected.equals("food bag")) {
      ingredient.updateNutrient();
    } else if (selected.equals("hoe")) {
      ingredient.updateWeed();
    }
  }
  
}
