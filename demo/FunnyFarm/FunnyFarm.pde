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
  frameRate(30);
  
  //set up ingredients
  for (int i = 0; i < 6; i++) {
    ingredients[i] = new Ingredient(iNames[i], 80 + (i / 3) * 175, (i % 3) * 150);
  }
  for (int i = 6; i < 12; i++) {
    ingredients[i] = new Ingredient(iNames[i], 170 + (i / 3) * 175, (i % 3) * 150);
  }
  
  //set up tools
  for (int i = 0; i < 5; i++) {
    tools[i] = new Tool(tNames[i], (i * 85) + 520, 905);
  }
}

void draw() {
  PImage farmbackground = loadImage("farm background.png");
  image(farmbackground, 0, 0);
  for (Ingredient item : ingredients) {
    item.display();
  }
  for (Tool t : tools) {
    t.display();
  }
}

void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  if (x < 790 && y < 450) {
    for (Ingredient item : ingredients) {
      if (x > item.x - 85 && y > item.y && x < (item.x + 90) && y < (item. y + 150)) {
        if (Proserpine.getSelected() == "") {
          Proserpine.selectIngredient(item);
          item.click();
        } else if (Proserpine.getTypeSelected() == "tool") {
          Proserpine.useTool(item);
        } else if (Proserpine.getSelected() == item.getType()) {
          Proserpine.deselect();
          item.click();
        } //here is where more else ifs should be added for future dishmaking
      }
    }
  } else if (x > 515 && y > 900) {
    for (Tool t : tools) {
      if (x > t.x && x < t.x + 85) {
        if (Proserpine.getSelected() == "") {
          Proserpine.selectTool(t);
          t.click();
        } else if (Proserpine.getSelected() == t.getType()) {
          Proserpine.deselect();
          t.click();
        }
      }
    }
  }
}
