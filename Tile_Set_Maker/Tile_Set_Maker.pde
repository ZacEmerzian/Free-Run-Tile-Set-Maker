// Zac Emerzian, 11-19-18 to 11-28-18
// Tileset Maker for Free Run

float gridSize;
ArrayList <Room> roomList;

PImage strIcon;
PImage balIcon;
PImage spdIcon;
PImage strBalIcon;
PImage balSpdIcon;
PImage strSpdIcon;



void setup() {
  size (1400, 1050);
  colorMode(HSB,100);
  rectMode(CENTER);
  imageMode(CENTER);
  background(50, 100, 100);
  noStroke();
  
  gridSize = width/4;
  roomList = new ArrayList <Room> ();
  
  // Images
  strIcon = loadImage("Strength_Icon.png");
  balIcon = loadImage("Balance_Icon.png");
  spdIcon = loadImage("Speed_Icon.png");
  strBalIcon = loadImage("Balance_Strength_Icon.png");
  balSpdIcon = loadImage("Speed_Balance_Icon.png");
  strSpdIcon = loadImage("Strength_Speed_Icon.png");
  
}

void draw() {
  background(50, 100, 0);
  
  // Draw the 12 tiles
  for (int i=0; i<roomList.size(); i++) {
    Room tempRoom = roomList.get(i);
    tempRoom.render();
  }
}

void mouseReleased() {
  // Remove the prior tile set
  for (int i=roomList.size()-1; i>=0; i--) {
    roomList.remove(i);
  }
  
  // Make a new tile set
  for (int i=0; i<int(width/gridSize); i++) {
      for (int j=0; j<int(height/gridSize); j++) {
        roomList.add( new Room( (gridSize/2) + gridSize*i, (gridSize/2) + gridSize*j ) );
      }
  }
  
}

void keyPressed() {
  save("Tile_Set.PNG");
}
