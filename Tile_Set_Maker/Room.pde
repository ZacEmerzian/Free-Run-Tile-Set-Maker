class Room { // 12 rooms
  PVector position;
  float size;
  int upExit;
  int downExit;
  int leftExit;
  int rightExit;
  color roomColor;
  
  ArrayList <Exit> exitList;
  
  
  Room(float xPos, float yPos) {
    position = new PVector(xPos, yPos);
    size = gridSize - 15;
    roomColor = color(100, 0, 90);
    
    upExit = determineExitNum( random(100) );
    downExit = determineExitNum( random(100) );
    leftExit = determineExitNum( random(100) );
    rightExit = determineExitNum( random(100) );
    
    // Adds an exit object if at least one player can pass through the exit
    exitList = new ArrayList <Exit> ();
    if (upExit > 0) {
      exitList.add( new Exit(position.x, position.y, 0, upExit) );
    }
    if (downExit > 0) {
      exitList.add( new Exit(position.x, position.y, 1, downExit) );
    }
    if (leftExit > 0) {
      exitList.add( new Exit(position.x, position.y, 2, leftExit) );
    }
    if (rightExit > 0) {
      exitList.add( new Exit(position.x, position.y, 3, rightExit) );
    }
    
  }
 
  void render() {
    fill(roomColor);
    rect(position.x, position.y, size, size);
    
    // Displays the number of players that can go through each exit
    //fill(10, 100, 0);
    //textAlign(CENTER, CENTER);
    //text(upExit, position.x, position.y - size/4);
    //text(downExit, position.x, position.y + size/4);
    //text(leftExit, position.x - size/4, position.y);
    //text(rightExit, position.x + size/4, position.y);
    
    // Draw the exits
    for (int i=0; i<exitList.size(); i++) {
      Exit tempExit = exitList.get(i);
      tempExit.render();
    }
    
    // Draws a random obstacle in the center of some tiles
    // Obstacles
    //switch( (upExit + downExit)%4) {
    //  case 0:
    //    image(strIcon, position.x, position.y, 100, 100);
    //    break;
    //  case 1:
    //    image(balIcon, position.x, position.y, 100, 100);
    //    break;
    //  case 2:
    //    image(spdIcon, position.x, position.y, 100, 100);
    //    break;
    //  default:
    //    break;
    //}
  }
  
}
