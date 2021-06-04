Player Proserpine = new Player();
Ingredient[] ingredients = new Ingredient[12];
String[] iNames = {"wheat", "rice", "corn", "tomato", "potato", "fish", "milk", 
                    "egg", "meat", "apple", "orange", "berry"};
//add kitchen tools later: knife, stirring spoon
Tool[] tools = new Tool[5];
String[] tNames = {"creation egg", "food bag", "watering can", "hoe", "basket"};

void setup() {
  size(1200, 1000);
  PImage background = loadImage("background.png");
  image(background, 0, 0);
  
  //set up ingredients
  for (int i = 0; i < 12; i++) {
    ingredients[i] = new Ingredient(iNames[i], 85 + (i / 3) * 175, (i % 3) * 150);
  }
  
  //set up tools
  for (int i = 0; i < 5; i++) {
    //fix spacing
    tools[i] = new Tool(tNames[i], i, i);
  }
  
}

void draw() {
  for (Ingredient item : ingredients) {
    item.display();
  }
}

void mousePressed() {
  if (Proserpine.getSelected() == "") {
    for (Ingredient item : ingredients) {
      if (Proserpine.getSelected() == "" && dist(mouseX, mouseY, item.x, item.y) <= 50) {
        Proserpine.selectIngredient(item);
      }
    }
  }
}
