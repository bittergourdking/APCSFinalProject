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
    tools[i] = new Tool(tNames[i], (i * 85) + 520, 905);
  }
  
  //testing
  fill(0);
  textSize(30);
  text(tools[0].x + ", " + tools[0].y, width / 2, height / 2);
}

void draw() {
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
  //clicking ingredients
  if (x < 790 && y < 450) {
    for (int i = 0; i < 12; i++) {
      if (x < 85 + (i / 3) * 175 && y < (i % 3) * 150) {
        if (Proserpine.getSelected() == "") {
          Proserpine.selectIngredient(ingredients[i - 1]);
          ingredients[i - 1].click();
        } else {
          Proserpine.useTool(ingredients[i - 1]);
        }
      }
    }
    
    if (Proserpine.getSelected() == "") {
      for (Tool t : tools) {
        if (Proserpine.getSelected() == "" && dist(mouseX, mouseY, t.x, t.y) <= 40) {
          Proserpine.selectTool(t);
          t.click();
        }   
      }
    } else {

    }
  }
  
  //clicking tool
  if (x > 515 && y > 900) {
    //select tool
  }
  
  if (Proserpine.getSelected() == "") {
    for (Ingredient item : ingredients) {
      if (Proserpine.getSelected() == "" && dist(mouseX, mouseY, item.x, item.y) <= 50) {
        Proserpine.selectIngredient(item);
        item.click();
      }
    }
  }
}
