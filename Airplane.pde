//----------------------------------------------------------
// Skytrain Airplane PDE Subfile - CS110H Spring 2014 Final Project
// C4C Beck, Christopher; M3H
//
// Inherits: None
//
// Inherited by: Sailplane, Towplane, TwinOtter
//
// Purpose: This object creates defines the properties of all airplane
// objects. This is still under major construction!
//----------------------------------------------------------


class Airplane {

  float x;
  float y;
  float r;
  float xVel;
  float yVel;
  float rVel;
  String status;
  String type;
  String runway;
  float time;
  int timeMin;
  int timeSec;
  float xDest;
  float yDest;
  float rDest;

  //These control the aircraft's behavior within the game
  boolean selected;
  boolean crashed;
  boolean clearedTaxiC;
  boolean clearedTaxiR;
  boolean clearedLineup;
  boolean clearedTakeoff;
  boolean airborne;
  boolean approach;
  boolean clearedLanding;
  boolean reset;
  boolean idle;
  boolean ready;

  //So you can control the aircraft
  Button takeoffButton, lineupButton, taxiCButton, taxiRButton, activateButton, stageButton;

  //The different possible images
  PImage twinOtterImage;
  PImage sailplaneImage;
  PImage towplaneImage;
  PImage airplaneImage;

  Airplane(float tempX, float tempY, float tempR) {
    x = tempX;
    y = tempY;
    r = tempR;
    xVel = 0;
    yVel = 0;
    rVel = 0;
    status = "";
    type = "";
    time = 0;
    timeMin = 0;
    timeSec = 0;
    xDest = x;
    yDest = y;
    rDest = r;

    selected = false;
    crashed = false;
    clearedTaxiC = false;
    clearedTaxiR = false;
    clearedTakeoff = false;
    airborne = false;
    approach = false;
    clearedLanding = false;
    reset = false;
    idle = false;


    taxiCButton = new Button(50, 350, "Taxi 16C");
    taxiRButton = new Button(50, 380, "Taxi 16R");
    lineupButton = new Button(50, 410, "Line-Up/Wait");
    takeoffButton = new Button(50, 440, "Takeoff");
    stageButton = new Button(50, 530, "Stage");
    activateButton = new Button(50, 560, "Activate");


    twinOtterImage = loadImage("twinotter.png");
    sailplaneImage = loadImage("sailplane.png");
    towplaneImage = loadImage("towplane.png");
  }



  void display() {

    //Move this to a new function, needs to be specific to the subclasses
    if (selected) {
      displayButtons();
      if (activateButton.clicked()) {
        status = "Active";
      }
      if (stageButton.clicked() && xVel == 0 && yVel == 0) {
        status = "Staging";
      }
      if (takeoffButton.clicked()) {
        clearedTakeoff = true;
      }
      if (taxiRButton.clicked()) {
        clearedTaxiR = true;
      }
      if (taxiCButton.clicked()) {
        clearedTaxiC = true;
      }
      if (lineupButton.clicked()) {
        clearedLineup = true;
      }
    }
    //////////////////////////////

    if (mousePressed) {
      checkClick();
    }
    pushMatrix();
    translate(x, y);
    rotate(r);
    image(airplaneImage, 0, 0);

    //This also needs moved to a separate function, specific to subclasses to get rid of the conditionals
    if (type.equals("Twin Otter")) {
      if (over() && !selected) {
        fill(0, 255, 0, 100);
        rect(-30, -26, 50, 54);
      }
      if (selected) {
        fill(0, 0, 255, 100);
        rect(-30, -26, 50, 54);
      }
    }
    if (type.equals("Towplane")) {
      if (over() && !selected) {
        fill(0, 255, 0, 100);
        rect(-20, -20, 40, 40);
      }
      if (selected) {
        fill(0, 0, 255, 100);
        rect(-20, -20, 40, 40);
      }
    }
    if (type.equals("Sailplane")) {
      if (over() && !selected) {
        fill(0, 255, 0, 100);
        rect(-20, -20, 40, 40);
      }
      if (selected) {
        fill(0, 0, 255, 100);
        rect(-20, -20, 40, 40);
      }
    }
    ///////////////////////////////

    popMatrix();
  }

  boolean over() {
    if (abs(mouseX-x)<20 && abs(mouseY-y)<20) {
      return true;
    } 
    else {
      return false;
    }
  }

  void checkClick() {
    selected = false;
    if (over()) {
      selected = true;
    }
  }

  void deselect() {
    selected = false;
  }

  void displayStatus(int textY) {
    text(status, -50, textY);
  }

  void displayButtons() {
    
    //Change this to be airplane specific!!
    
    if (status.equals("Inactive")) {
      deactivateButtons();
      activateButton.activate();
    } 
    else
      if (status.equals("Active")) {
        deactivateButtons();
        taxiCButton.activate();
        taxiRButton.activate();
        stageButton.activate();
      }
      else {
        deactivateButtons();
        taxiCButton.activate();
        taxiRButton.activate();
        lineupButton.activate();
        takeoffButton.activate();
      }
    taxiCButton.display();
    taxiRButton.display();
    lineupButton.display();
    takeoffButton.display();
    stageButton.display();
    activateButton.display();
  }

  void deactivateButtons() {
    taxiCButton.deactivate();
    taxiRButton.deactivate();
    lineupButton.deactivate();
    takeoffButton.deactivate();
    stageButton.deactivate();
    activateButton.deactivate();
  }

  Float giveX() {
    return x;
  }

  Float giveY() {
    return y;
  }

  void setCrash() {
    crashed = true;
    status = "Crashed";
    yVel = 0;
    xVel = 0;
    selected = false;
    clearedTakeoff = false;
    airborne = false;
    approach = false;
    clearedLanding = false;
    reset = false;
    idle = false;
  }
}
