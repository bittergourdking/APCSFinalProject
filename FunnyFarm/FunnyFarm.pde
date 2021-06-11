Player Proserpine = new Player();
Detective Yves;

Ingredient[] ingredients = new Ingredient[12];
String[] iNames = {"wheat", "rice", "corn", "tomato", "potato", "fish", "milk", 
                    "egg", "meat", "apple", "orange", "berry"};

Tool[] tools = new Tool[8];
String[] tNames = {"creation egg", "food bag", "watering can", "hoe", "basket",
                   "knife", "mixing bowl", "magic wand"};
                   
Customer[] customers = new Customer[8];
String[] cNames = {"Akiyo", "Barley", "Damon", "Galvin", "Hildefons", "Mark",
                    "Ozimina", "Quinn", "Shua"};

Dish[] dishes = new Dish[8];
String[] dNames = {};

PImage background, startscreen;
boolean[] spotsTaken = new boolean[4];
int nextSpot, YvesActivationTime, customerActivationTime, currentTime, money;
boolean pause = true;

void setup() {
  size(1200, 1000);
  background = loadImage("background.png");
  image(background, 0, 0);
  frameRate(30);
  
  //misc. set ups
  Yves = new Detective();
  
  //set up ingredients
  for (int i = 0; i < 6; i++) {
    ingredients[i] = new Ingredient(iNames[i], 80 + (i / 3) * 175, (i % 3) * 150);
  }
  for (int i = 6; i < 12; i++) {
    ingredients[i] = new Ingredient(iNames[i], 170 + (i / 3) * 175, (i % 3) * 150);
  }
  
  //set up tools
  for (int i = 0; i < 8; i++) {
    tools[i] = new Tool(tNames[i], (i * 85) + 520, 905);
  }
  
  //set up customers
  for (int i = 0; i < 8; i++) {
    customers[i] = new Customer(cNames[i]);
  }
  
  //insert set up for dishes
}

void draw() {
  image(background, 0, 0);
  currentTime = millis() / 1000;
  if (currentTime == 600) {
    if (money > 1000) {
      endGame(2);
    } else {
      endGame(3);
    }
  }
  textSize(45);
  text(600 - currentTime + "s left", 15, 965);
  for (Ingredient item : ingredients) {
    item.display();
  }
  for (Tool t : tools) {
    t.display();
  }
  
  /*nextSpot = randomSpot();
  for (Customer c : customers) {
    if (currentTime - c.getActivationTime() >= 90) { //change the 10 here
      c.deactivate();
      spotsTaken[c.getSpot()] = false;
    } else if (c.isActive()) {
      c.display();
    } else if (currentTime > 10 && nextSpot != -1 && currentTime - customerActivationTime >= 20
            && !c.isActive() && Math.random() > .97) { 
      c.activate(nextSpot * 195 + 10);
      c.setSpot(nextSpot);
      customerActivationTime = millis() / 1000;
    }
  }*/
  nextSpot = randomSpot();
  if (Yves.isActive()) {
    Yves.display();
    if (currentTime - YvesActivationTime >= 15) {
      Yves.deactivate();
      spotsTaken[Yves.getSpot()] = false;
    }
  } else if (currentTime > 10 && currentTime - YvesActivationTime >= 5
          && nextSpot != -1 && Math.random() > .97) {
    Yves.activate(nextSpot * 195 + 10);
    Yves.setSpot(nextSpot);
    YvesActivationTime = millis() / 1000;
  }
}

void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  if (Yves.isActive() && x < 790 && y > 450) {
    endGame(1);
  }
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

int randomSpot() {
  if (!spotsTaken[0]) {
    spotsTaken[0] = true;
    return 0;
  } else if (!spotsTaken[3]) {
    spotsTaken[3] = true;
    return 3;
  } else if (!spotsTaken[1]) {
    spotsTaken[1] = true;
    return 1;
  } else if (!spotsTaken[2]) {
    spotsTaken[2] = true;
    return 2;
  }
  return -1;
}

void endGame(int n) {
  pause = true;
  if (n == 1) {
    //caught by yves
  } else if (n == 2) {
    //not enough money
  } else {
    //good ending
  }
}
