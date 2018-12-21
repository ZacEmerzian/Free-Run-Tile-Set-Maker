
// Receives a random float as a seed, and returns the int number of characters that can pass through each exit of the tile
int determineExitNum(float seed) {
  int result;
  
  int zeroPercent = 5;
  int onePercent = 15;
  int twoPercent = 30;
  int threePercent = 40;
  int fourPercent = 10;
  
  if (seed <= zeroPercent) {
    result = 0;
  }
  else if (seed <= zeroPercent + onePercent) {
    result = 1;
  }
  else if (seed <= zeroPercent + onePercent + twoPercent) {
    result = 2;
  }
  else if (seed <= zeroPercent + onePercent + twoPercent + threePercent) {
    result = 3;
  }
  else { 
    result = 4;
  }
  
  return result;
}


// Receives the string of characters that can pass through the exit, and returns an appropriate stat check string
String colorsToChecks(String playerLines) {
  String result = "";
  // we didn't want the same player paths to look the same, we wanted it to feel like discovery, they would have to check each time
  if (playerLines.equals("RBGY")) {
    int pick = floor(random(10));
    switch (pick) {
      case 0:
        result = "Str 1";
        break;
      case 1:
        result = "Str 2";
        break;
      case 2:
        result = "Spd 1";
        break;
      case 3:
        result = "Bal 1";
        break;
      case 4:
        result = "Str + \nBal 3";
        break;
      case 5:
        result = "Str + \nSpd 3";
        break;
      case 6:
        result = "Bal + \nSpd 3";
        break;
      case 7:
        result = "Str + \nBal 4";
        break;
      case 8:
        result = "Str + \nSpd 4";
        break;
      case 9:
        result = "Bal + \nSpd 3";
        break;
      default:
        result = "OOPS";
    }
  }
  
  else if (playerLines.equals("RBG")) {
    result = "Bal + \nSpd 5";
  }
  
  else if (playerLines.equals("RBY")) {
    result = "Str 3";
  }
  
  else if (playerLines.equals("RGY")) {
    int pick = floor(random(2));
    switch (pick) {
      case 0:
        result = "Bal 2";
        break;
      case 1:
        result = "Str + \nBal 5";
        break;
      default:
        result = "OOPS";
    }
  }
  
  else if (playerLines.equals("BGY")) {
    int pick = floor(random(2));
    switch (pick) {
      case 0:
        result = "Spd 2";
        break;
      case 1:
        result = "Str + \nSpd 5";
        break;
      default:
        result = "OOPS";
    }
  }
  
  else if (playerLines.equals("RB")) {
    result = "N/A 0";
  }
  
  else if (playerLines.equals("RG")) {
    result = "Spd 3";
  }
  
  else if (playerLines.equals("RY")) {
    result = "Str + \nSpd 6";
  }
  
  else if (playerLines.equals("BG")) {
    result = "Bal 3";
  }
  
  else if (playerLines.equals("BY")) {
    result = "Str + \nBal 6";
  }
  
  else if (playerLines.equals("GY")) {
    result = "N/A 0";
  }
  
  else if (playerLines.equals("R")) {
    int pick = floor(random(2));
    switch (pick) {
      case 0:
        result = "Spd 4";
        break;
      case 1:
        result = "Str + \nSpd 7";
        break;
      default:
        result = "OOPS";
    }
  }
  
  else if (playerLines.equals("B")) {
    int pick = floor(random(2));
    switch (pick) {
      case 0:
        result = "Bal 4";
        break;
      case 1:
        result = "Str + \nBal 7";
        break;
      default:
        result = "OOPS";
    }
  }
  
  else if (playerLines.equals("G")) {
    result = "Bal + \nSpd 6";
  }
  
  else if (playerLines.equals("Y")) {
    result = "Str 4";
  }
  
  return result;
}
