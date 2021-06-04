Ingredient[] ingredients;
Tool[] tools;

void setup() {
  size(1200, 1000);
  PImage background = loadImage("background.png");
  image(background, 0, 0);
  
  //set up ingredients
  ingredients = new Ingredient[12];
  String[] iNames = {"wheat", "rice", "corn", "tomato", "potato", "fish", "milk", 
                    "egg", "meat", "apple", "orange", "berry"};
  for (int i = 0; i < 12; i++) {
    ingredients[i] = new Ingredient(iNames[0], 85 + (i / 3) * 175, (i % 3) * 150);
  }
  
  //set up tools
  tools = new Tool[8];
  String[] tNames = {"", "food bag", "watering can", "hoe", "basket"};
}

void draw() {
  for (Ingredient item : ingredients) {
    item.display();
  }
}

void mousePressed() {
  
}
