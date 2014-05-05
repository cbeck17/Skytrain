//----------------------------------------------------------
// Skytrain Sailplane PDE Subfile - CS110H Spring 2014 Final Project
// C4C Beck, Christopher; M3H
//
// Inherits: Airplane
//
// Inherited by: None
//
// Purpose: This is the class that defines the specific properties,
// methods, and parameters of the sailplane objects within the game.
//----------------------------------------------------------


class Sailplane extends Airplane {

  Sailplane(float tempX, float tempY, float tempR) {
    super(tempX, tempY, tempR);
    airplaneImage = sailplaneImage;
    type = "Sailplane";
    status = "Active"; //Active for testing only, change to inactive later!
  }

  void control() {
    activate();
    stage();
    taxi();
    lineup();
    takeoff();
    airborne();
    approach();
    landing();
    x = x + xVel;
    y = y + yVel;
    r = r + rVel;
  }

  void clearedToTaxi() {
    reset = true;
    clearedTaxiC = true;
  }

  void stage() {
    if (status.equals("Staging")) {
      if (runway.equals("16C") || runway.equals("16R")) {
        if (x < 600) {
          xVel = 0.5;
        }
        if (x >= 600) {
          xVel = 0;
          x = 600;
        }
      }
      if (runway.equals("SPLA 1") || runway.equals("SPLA 2") || runway.equals("SPLA 3") || runway.equals("SPLA 4")) {
        if (r>-PI/2) {
          r = r - radians(0.5);
        } 
        else
          if (r<=-PI/2) {
            r = -PI/2;
            if (y > 350) {
              yVel = -0.5;
            }
            else if (y <= 350) {
              yVel = 0;
              y = 350;
            }
          }
      }
    }
  }

  void activate() {
    if (status.equals("Active")) {
      runway = "16C";
      if (y < 50) {
        yVel = 0.5;
      }
      if (y >= 50) {
        yVel = 0;
      }
    }
  }

  void taxi() {
    if (clearedTaxiC || clearedTaxiR) {
      if (reset == true) {
        x = 76;
        y= -150;
        r= HALF_PI;
        reset = false;
      }
      status = "Taxiing";
      if (y<50) {
        yVel = 0.5;
      }
      if (y>=50) {
        yVel = 0;
        status = "Holding Short 16C";
        runway = "16C";
        clearedTaxiC = false;
        clearedTakeoff = false;
        if (clearedTaxiR) {
          if (y < 205) {
            status = "Taxiing";
            yVel = 0.5;
          }
          if (y >= 205) {
            status = "Holding Short 16R";
            runway = "16R";
            clearedTaxiR = false;
          }
        }
      }
    }
  }

  void lineup() {
    if (clearedLineup) {
      if (runway.equals("16C")) {
        if (y<125) {
          status = "Lining Up 16C";
          yVel = 0.5;
        }
        if (y>=125) {
          yVel = 0;
          y = 125;
          if (r>0) {
            status = "Lining Up 16C";
            r = r - radians(0.5);
          }
          if (r<=0) {
            r = 0;
            clearedLineup = false;
          }
        }
      }
      if (runway.equals("16R")) {
        if (y<275) {
          status = "Lining Up 16R";
          yVel = 0.5;
        }
        if (y>=275) {
          yVel = 0;
          y = 275;
          if (r>0) {
            status = "Lining Up 16R";
            r = r - radians(0.5);
          }
          if (r<=0) {
            r = 0;
            clearedLineup = false;
          }
        }
      }
    }
  }

  void takeoff() {
    if (clearedTakeoff) {
      r = 0;
      if (x<=600) {
        xVel = xVel + 0.004;
        status = "Taking Off";
      }
      if (x>600 && xVel<1.25) {
        xVel = xVel + 0.003;
        status = "Taking Off";
      }
      if (x>600 && xVel>=1.25) {
        xVel = 1.25;
        status = "Taking Off";
      }
      if (x>1100) {
        xVel = 0;
        status = "Airborne";
        airborne = true;
      }
    }
  }

  void airborne() {
    if (airborne == true) {
      runway = "";
      if (clearedTakeoff == true) {
        time = millis();
        time = round(time/1000);
        clearedTakeoff = false;
      }
      timeSec = int((time+20));
      timeSec = timeSec - int(ceil(millis()/1000));
      timeMin = ceil((timeSec/60));
      status = "Airborne: " + timeMin + ":" + (timeSec-(timeMin*60)) ;
      if ((timeSec-(timeMin*60))<10) {
        status = "Airborne: " + timeMin + ":0" + (timeSec-(timeMin*60)) ;
      }
      if (timeSec<=0) {
        if (timeMin<=0) {
          approach = true;
        }
      }
    }
  }

  void approach() {
    if (approach == true) {
      if (airborne == true) {
        time = millis();
        time = round(time/1000);
        airborne = false;
      }
      timeSec = int((time+10));
      timeSec = timeSec - int(ceil(millis()/1000));
      timeMin = ceil((timeSec/60));
      status = "Approach: " + timeMin + ":" + (timeSec-(timeMin*60)) ;
      if ((timeSec-(timeMin*60))<10) {
        status = "Approach: " + timeMin + ":0" + (timeSec-(timeMin*60)) ;
      }
      if (runway.equals("")) {
        selected = true;
      } 
      else {
        selected = false;
        status = "Approach " + runway + ": " + timeMin + ":" + (timeSec-(timeMin*60)) ;
        if ((timeSec-(timeMin*60))<10) {
          status = "Approach " + runway + ": " + timeMin + ":0" + (timeSec-(timeMin*60)) ;
        }
      }
      if (timeSec<=0) {
        if (timeMin<=0) {
          clearedLanding = true;
        }
      }
    }
  }

  void landing() {
    if (clearedLanding == true) {
      if (approach == true) {
        if (runway.equals("16C")) {
          y = 125;
        } 
        else if (runway.equals("16R")) {
          y = 275;
        }
        else if (runway.equals("SPLA 1")) {
          y = 428;
        }
        else if (runway.equals("SPLA 2")) {
          y = 478;
        }
        else if (runway.equals("SPLA 3")) {
          y = 528;
        }
        else if (runway.equals("SPLA 4")) {
          y = 578;
        }
        x = -100;
        approach = false;
        status = "Landing " + runway;
      }
      if (runway.equals("16C") || runway.equals("16R")) {
        if (x<125) {
          xVel = 1.25;
        }
        if (x>125 && xVel > 0.25) {
          xVel = xVel - 0.004;
        }
        if (x>350) {
          xVel = 0;
          status = "Landed " + runway + " -- Waiting";
        }
      }
      if (runway.equals("SPLA 1") || runway.equals("SPLA 2") || runway.equals("SPLA 3") || runway.equals("SPLA 4")) {
        if (x<200) {
          xVel = 1.5;
        }
        if (x>200 && xVel > 0.25) {
          xVel = xVel - 0.003;
        }
        if (x>=500) {
          xVel = 0;
          status = "Landed " + runway + " -- Waiting";
        }
      }
    }
  }

  float getXVel() {
    return xVel;
  }
}
