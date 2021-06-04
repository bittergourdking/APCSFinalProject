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
  frameRate(12);
  
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
  
  //testing delete later
  fill(0);
  textSize(30);
  text(ingredients[0].x + ", " + ingredients[0].y, width / 2, height / 2);
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
        item.click();
        if (Proserpine.getSelected() == "") {
          Proserpine.selectIngredient(item);
        } else if (Proserpine.getTypeSelected() == "tool") {
          Proserpine.useTool(item);
        } else if (Proserpine.getTypeSelected() == "ingredient") {
          Proserpine.deselect();
        } //here is where more else ifs should be added for future dishmaking
      }
    }
  } else if (x > 515 && y > 900) {
    for (Tool t : tools) {
      if (x > t.x && x < t.x + 85) {
        t.click();
        if (Proserpine.getSelected() == "") {
          Proserpine.selectTool(t);
        } else if (Proserpine.getTypeSelected() == "tool") {
          Proserpine.deselect();
        }
      }
    }
  }
}
