class Exit {
  PVector position;
  float xOffSet;
  float yOffSet;
  int direction;
  int exitCount;
  int who[];
  IntList playerBase;
  String whoExit;
  String checks;
  PImage symbol;
  int number;
  
  
  Exit(float xPos, float yPos, int tempDirection, int tempCount) {
    direction = tempDirection;
    switch(direction) {
      case 0: // up
        xOffSet = 0;
        yOffSet = -(gridSize/3);
        break;
      case 1: // down
        xOffSet = 0;
        yOffSet = (gridSize/3);
        break;
      case 2: // left
        xOffSet = -(gridSize/3);
        yOffSet = 0;
        break;
      case 3: // right
        xOffSet = (gridSize/3);
        yOffSet = 0;
        break;
      default:
        xOffSet = 0;
        yOffSet = 0;
        break;
    }
    position = new PVector(xPos + xOffSet, yPos + yOffSet);
    exitCount = tempCount;
    who = new int[exitCount];
    playerBase = new IntList(1, 2, 3, 4);
    whoExit = "";
    
    
    // Player Lines
    for (int i=0; i<exitCount; i++) { // for each character that can go through each exit
      int rand = floor(random( playerBase.size() )); // makes a random number between 0 and the playerBase, initially 0-4, then 0-3, 0-2, and lastly 0-1
      int temp = playerBase.remove(rand); // removes that number from the base
      who[i] = temp; // makes that character able to pass through the exit
      
      // Stores who can pass each exit
      if (who[i] == 1) {
        whoExit = whoExit.concat("R"); 
      }
      else if (who[i] == 2) {
        whoExit = whoExit.concat("Y");
      }
      else if (who[i] == 3) {
        whoExit = whoExit.concat("G");
      }
      else if (who[i] == 4) {
        whoExit = whoExit.concat("B");
      }
      
    }
    //println(whoExit);
    
    // Reorder the string
    if ( whoExit.contains("R") ) { // if R is in the string
      whoExit = whoExit.replaceFirst("R","");
      whoExit = whoExit.concat("R");
    }
    if ( whoExit.contains("B") ) { // if B is in the string
      whoExit = whoExit.replaceFirst("B","");
      whoExit = whoExit.concat("B");
    }
    if ( whoExit.contains("G") ) { // if G is in the string
      whoExit = whoExit.replaceFirst("G","");
      whoExit = whoExit.concat("G");
    }
    if ( whoExit.contains("Y") ) { // if Y is in the string
      whoExit = whoExit.replaceFirst("Y","");
      whoExit = whoExit.concat("Y");
    }
    whoExit.trim();
    //println(whoExit); //<>//
    
    checks = colorsToChecks(whoExit);
    
    symbol = getCheckType(checks);
    number = getCheckNum(checks);
    
  }
  
  void render() {
    
    // Bridges between tiles
    fill(100, 0, 90);
    if ( !checks.equals("N/A 0") ) {
      switch(direction) {
        case 0: // up
          rect(position.x, position.y - 33, 25, 48);
          break;
        case 1: // down
          rect(position.x, position.y + 33, 25, 48);
          break;
        case 2: // left
          rect(position.x - 33, position.y, 48, 25);
          break;
        case 3: // right
          rect(position.x + 33, position.y, 48, 25);
          break;
        default:
          
          break;
      }
    }
    
    // Colored Character Lines - these showed which characters can go through the exit
    //for (int i=0; i<exitCount; i++) { // for each character that can go through each exit
    //  fill( (who[i]-1) * 15, 100, 100); //<>//
    //  switch(direction) {
    //    case 0: // up
    //      rect(position.x - 6 + ( (who[i] - 1) * 5), position.y, 5, 25);
    //      break;
    //    case 1: // down
    //      rect(position.x - 6 + ( (who[i] - 1) * 5), position.y, 5, 25);
    //      break;
    //    case 2: // left
    //      rect(position.x, position.y - 6 + ( (who[i] - 1) * 5), 25, 5);
    //      break;
    //    case 3: // right
    //      rect(position.x, position.y - 6 + ( (who[i] - 1) * 5), 25, 5);
    //      break;
    //    default:
    //      break;
    //  }
    //}
    
    fill(10, 100, 0);
    textAlign(CENTER, CENTER);
    //text(checks, position.x, position.y); // the written stat check
    //text(whoExit, position.x, position.y); // the string of which characters can exit (ie. RBY)
    
    addImages();
    
  }
  
  void addImages() {
    // Icons
    float iconSize = 40; // 32, 24
    switch(direction) {
      case 0: // up
        for(int i=0; i<number; i++) {
          image(symbol, position.x + ( (iconSize/1.5)*i ) - ( (iconSize/3)*number ) + iconSize/3, position.y - 64 + iconSize, iconSize, iconSize); // 48
        }
        break;
      case 1: // down
        for(int i=0; i<number; i++) {
          image(symbol, position.x + ( (iconSize/1.5)*i ) - ( (iconSize/3)*number ) + iconSize/3, position.y + 64 - iconSize, iconSize, iconSize);
        }
        break;
      case 2: // left
        for(int i=0; i<number; i++) {
          image(symbol, position.x - 64 + iconSize, position.y + ( (iconSize/1.5)*i ) - ( (iconSize/3)*number ) + iconSize/3, iconSize, iconSize);
        }
        break;
      case 3: // right
        for(int i=0; i<number; i++) {
          image(symbol, position.x + 64 - iconSize, position.y + ( (iconSize/1.5)*i ) - ( (iconSize/3)*number ) + iconSize/3, iconSize, iconSize);
        }
        break;
      default:
        break;
    }
  }
  
  
  PImage getCheckType(String statCheck) {
    
    if ( (statCheck == "Str 1") || (statCheck == "Str 2") || (statCheck == "Str 3") || (statCheck == "Str 4") ) {
      return strIcon;
    }
    else if ( (statCheck == "Bal 1") || (statCheck == "Bal 2") || (statCheck == "Bal 3") || (statCheck == "Bal 4") ) {
      return balIcon;
    }
    else if ( (statCheck == "Spd 1") || (statCheck == "Spd 2") || (statCheck == "Spd 3") || (statCheck == "Spd 4") ) {
      return spdIcon;
    }
    else if ( (statCheck == "Str + \nBal 3") || (statCheck == "Str + \nBal 4") || (statCheck == "Str + \nBal 5") || (statCheck == "Str + \nBal 6") || (statCheck == "Str + \nBal 7") ) {
      return strBalIcon;
    }
    else if ( (statCheck == "Bal + \nSpd 3") || (statCheck == "Bal + \nSpd 4") || (statCheck == "Bal + \nSpd 5") || (statCheck == "Bal + \nSpd 6") || (statCheck == "Bal + \nSpd 7") ) {
      return balSpdIcon;
    }
    else if ( (statCheck == "Str + \nSpd 3") || (statCheck == "Str + \nSpd 4") || (statCheck == "Str + \nSpd 5") || (statCheck == "Str + \nSpd 6") || (statCheck == "Str + \nSpd 7") ) {
      return strSpdIcon;
    }
    else {
      return strIcon;
    }
  }
  
  int getCheckNum(String statCheck) {
    int result;
    result = int( Integer.parseInt( statCheck.substring(statCheck.length() - 1) ) );
    return result;
  }
  
  
}
