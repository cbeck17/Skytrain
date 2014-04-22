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
    xVel = 0;
    yVel = 0;
    activate();
    stage();
    taxi();
    lineup();
    takeoff();
    airborne();
    approach();
    landing();
    turnAround();
    x = x + xVel;
    y = y + yVel;
    r = r + rVel;
    println(status);
  }

  void clearedToTaxi() {
    reset = true;
    clearedTaxiC = true;
  }
  
  void stage() {
    if (status.equals("Staging")) {
      
    }
  }

  void activate() {
    if (status.equals("Active")) {
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
      if (runway.equals("16C")) {
        if (y<125) {
          status = "Taking Off";
          yVel = 0.5;
        }
        if (y>=125) {
          yVel = 0;
          y = 125;
          if (r>0) {
            status = "Taking Off";
            r = r - radians(0.5);
          }
          if (r<=0) {
            r = 0;
            if (x<=600) {
              xVel = xVel + 0.003;
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
      }
      if (runway.equals("16R")) {
        if (y<275) {
          status = "Taking Off";
          yVel = 0.5;
        }
        if (y>=275) {
          yVel = 0;
          y = 275;
          if (r>0) {
            status = "Taking Off";
            r = r - radians(0.5);
          }
          if (r<=0) {
            r = 0;
            if (x<=100) {
              xVel = xVel + 0.004;
              status = "Taking Off";
            }
            if (x>100 && xVel<1.5) {
              xVel = xVel + 0.003;
              status = "Taking Off";
            }
            if (x>100 && xVel>=1.5) {
              xVel = 1.5;
              status = "Taking Off";
            }
            if (x>1100) {
              xVel = 0;
              status = "Airborne";
              airborne = true;
            }
          }
        }
      }
    }
  }

  void airborne() {
    if (airborne == true) {
      if (clearedTakeoff == true) {
        time = millis();
        time = round(time/1000);
        clearedTakeoff = false;
      }
      timeSec = int((time+10));
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
      //      chooseRunway();
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
        y = 126;
        x = -100;
        approach = false;
        status = "Landing";
      }
      if (x<200) {
        xVel = 1.5;
      }
      if (x>200 && xVel > 0.5) {
        xVel = xVel - 0.002;
      }
      if (x>800) {
        xVel = 0.5;
        status = "Clearing Runway";
      }
      if (x >= 925) {
        xVel = 0;
        status = "Clearing Runway";
        if (r>-HALF_PI) {
          yVel = 0;
          r = r - HALF_PI/180;
        }
        if (r<=-HALF_PI) {
          r = -HALF_PI;
          if (y>-100) {
            yVel = -0.5;
          }
          if (y<100) {
            status = "Taxiing";
          }
        }
        if (y<=-150) {
          xVel = 0;
          xVel = 0;
          reset = true;
        }
      }
    }
  }

  void turnAround() {
    if (reset == true) {
      if (clearedLanding == true) {
        time = millis();
        time = round(time/1000);
        clearedLanding = false;
      }
      timeSec = int((time+10));
      timeSec = timeSec - int(ceil(millis()/1000));
      timeMin = ceil((timeSec/60));
      status = "Reloading: " + timeMin + ":" + (timeSec-(timeMin*60)) ;
      if ((timeSec-(timeMin*60))<10) {
        status = "Reloading: " + timeMin + ":0" + (timeSec-(timeMin*60)) ;
      }
      if (timeSec<=0) {
        if (timeMin<=0) {
          clearedTaxiC = true;
        }
      }
    }
  }
}
