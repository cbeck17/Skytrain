//----------------------------------------------------------
// Skytrain Towplane PDE Subfile - CS110H Spring 2014 Final Project
// C4C Beck, Christopher; M3H
//
// Inherits: Airplane
//
// Inherited by: None
//
// Purpose: This is the class that defines the specific properties,
// methods, and parameters of the towplane objects within the game.
//----------------------------------------------------------


class Towplane extends Airplane {

  boolean taxiToFuel;
  float fuel;
  float neededFuel;

  Towplane(float tempX, float tempY, float tempR) {
    super(tempX, tempY, tempR);
    airplaneImage = towplaneImage;
    taxiToFuel = false;
    fuel = 100;
    type = "Towplane";
    status = "Active";
  }

  void control() {
    if (!reset) {
      fuel = fuel - 0.0001;
      if (clearedTakeoff || airborne || approach || clearedLanding) {
        fuel = fuel - 0.001;
      }
    }
    activate();
    stage();
    taxi();
    lineup();
    takeoff();
    airborne();
    approach();
    landing();
    clearRunway();
    lineupMidfield();
    taxiToFuel();
    turnAround();
    println(fuel);
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
    }
  }

  void activate() {
    if (status.equals("Active")) {
      runway = "16R";
      if (y > 340) {
        yVel = -0.5;
      }
      if (y <= 340) {
        yVel = 0;
      }
    }
  }

  void taxi() {
    if (clearedTaxiC || clearedTaxiR) {

      if (reset == true) {
        x = 925;
        y= 1000;
        r= -HALF_PI;
        reset = false;
      }
      status = "Taxiing";
      if (y > 340) {
        yVel = - 0.5;
      }
      if (y<=340) {
        yVel = 0;
        status = "Holding Short 16R";
        runway = "16R";
        clearedTaxiR = false;
        clearedTakeoff = false;
        if (clearedTaxiC) {
          if (y > 195) {
            status = "Taxiing";
            yVel = -0.5;
          }
          if (y <= 195) {
            status = "Holding Short 16C";
            runway = "16C";
            clearedTaxiR = false;
          }
        }
      }
    }
  }

  void lineup() {
    if (clearedLineup) {
      if (runway.equals("16C")) {
        if (y > 125) {
          status = "Lining Up 16C";
          yVel = -0.5;
        }
        if (y<=125) {
          yVel = 0;
          y = 125;
          if (r>-PI) {
            status = "Lining Up 16C";
            r = r - radians(0.5);
          }
          if (r<=-PI) {
            r = - PI;
            if (x > 650) {
              xVel = -0.5;
            }
            if (x <= 650) {
              xVel = 0;
              x = 650;
            }
          }
          if (x <= 650) {
            if (r < 0) {
              r = r + radians(1);
            }
            if (r >= 0) {
              r = 0;
              clearedLineup = false;
            }
          }
        }
      }
      if (runway.equals("16R")) {
        if (y > 275) {
          status = "Lining Up 16R";
          yVel = -0.5;
        }
        if (y<=275) {
          yVel = 0;
          y = 275;
          if (r>-PI) {
            status = "Lining Up 16R";
            r = r - radians(0.5);
          }
          if (r<=-PI) {
            r = - PI;
            if (x > 650) {
              xVel = -0.5;
            }
            if (x <= 650) {
              xVel = 0;
              x = 650;
            }
          }
          if (x <= 650) {
            if (r < 0) {
              r = r + radians(1);
            }
            if (r >= 0) {
              r = 0;
              clearedLineup = false;
            }
          }
        }
      }
    }
  }

  void takeoff() {
    if (clearedTakeoff) {
      xVel = sailplane.getXVel();
      if (xVel > 0) {
        status = "Towing";
      }
      if (xVel == 0) {
        status = "Attached";
      }
      pushMatrix();
      translate(x, y);
      rotate(r);
      stroke(3);
      line(-15, 0, -95, 0);
      popMatrix();
      if (x > 1000 && xVel == 0) {
        airborne = true;
      }
    }
  }

  void airborne() {
    if (airborne) {
      runway = "";
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
    if (approach) {
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
        x = -100;
        approach = false;
        status = "Landing " + runway;
      }
      if (runway.equals("16C") || runway.equals("16R")) {
        if (x<125) {
          xVel = 1.25;
        }
        if (x>=125 && xVel > 0.25) {
          xVel = xVel - 0.004;
        }
        if (x>350) {
          xVel = 0;
          status = "Landed " + runway + " -- Waiting";
          clearRunway = true;
          clearedLanding = false;
        }
      }
    }
  }

  void clearRunway() {
    if (clearRunway) {
      if (runway.equals("16C")) {
        if (y < 200) {
          if (r < PI/4) {
            status = "Clearing 16C";
            r = r + radians(0.5);
          }
          if (r >= PI/4) {
            r = PI/4;
            if (y < 200) {
              xVel = 0.3535;
              yVel = 0.3535;
            }
          }
        }
        if (y >= 200) {
          xVel = 0;
          yVel = 0;
          y = 200;
          if (r > 0) {
            status = "Holding Midfield";
            r = r - radians(0.5);
          }
          if (r <= 0) {
            r = 0;
            if (x < 575) {
              xVel = 0.5;
            }
            if (x >= 575) {
              xVel = 0;
              x = 575;
              taxiToFuel = true;
              clearRunway = false;
            }
          }
        }
      }
      if (runway.equals("16R")) {
        if (y > 200) {
          if (r > -PI/4) {
            status = "Clearing 16R";
            r = r - radians(0.5);
          }
          if (r <= -PI/4) {
            r = -PI/4;
            if (y > 200) {
              xVel = 0.3535;
              yVel = -0.3535;
            }
          }
        }
        if (y <= 200) {
          xVel = 0;
          yVel = 0;
          y = 200;
          if (r < 0) {
            status = "Holding Midfield";
            r = r + radians(0.5);
          }
          if (r >= 0) {
            r = 0;
            if (x < 575) {
              xVel = 0.5;
            }
            if (x >= 575) {
              xVel = 0;
              x = 575;
              taxiToFuel = true;
              clearRunway = false;
            }
          }
        }
      }
    }
  }

  void lineupMidfield() {
    if (clearSecondaryLineup) {
      if (runway.equals("16C")) {
        if (x < 650) {
          if (r > -PI/4) {
            status = "Lining Up 16C";
            r = r - radians(0.5);
          }
          if (r <= -PI/4) {
            r = -PI/4;
            xVel = 0.3535;
            yVel = -0.3535;
          }
        }
        if (x >= 650) {
          xVel = 0;
          yVel = 0;
          x = 650;
          if (r < 0) {
            status = "Holding 16C";
            r = r + radians(0.5);
          }
          if (r >= 0) {
            r = 0;
          }
        }
      }
      if (runway.equals("16R")) {
        if (x < 650) {
          if (r < PI/4) {
            status = "Lining Up 16R";
            r = r + radians(0.5);
          }
          if (r >= PI/4) {
            r = PI/4;
            if (y < 275) {
              xVel = 0.3535;
              yVel = 0.3535;
            }
          }
        }
        if (x >= 650) {
          xVel = 0;
          yVel = 0;
          x = 650;
          if (r > 0) {
            status = "Holding 16R";
            r = r - radians(0.5);
          }
          if (r <= 0) {
            r = 0;
          }
        }
      }
    }
  }

  void taxiToFuel() {
    if (taxiToFuel) {
      println(x);
      if (runway.equals("16C")) {
        if (x < 650) {
          if (r > -PI/4) {
            status = "Taxi Refuel 16C";
            r = r - radians(0.5);
          }
          if (r <= -PI/4) {
            r = -PI/4;
            xVel = 0.3535;
            yVel = -0.3535;
          }
        }
        if (x >= 650 && x < 925) {
          xVel = 0;
          yVel = 0;
          if (r < 0) {
            status = "Taxi Refuel 16C";
            r = r + radians(0.5);
          }
          if (r >= 0) {
            r = 0;
            xVel = 0.5;
          }
        }
        if (x >= 925) {
          xVel = 0;
          yVel = 0;
          x = 925;
          if (r < HALF_PI) {
            status = "Taxi Refuel";
            r = r + radians(0.5);
          }
          if (r >= HALF_PI) {
            r = HALF_PI;
            if (y < 1000) {
              yVel = 0.5;
            }
            if (y >= 1000) {
              yVel = 0;
              reset = true;
            }
          }
        }
      }
      if (runway.equals("16R")) {
        if (x < 650) {
          if (r < PI/4) {
            status = "Taxi Refuel 16R";
            r = r + radians(0.5);
          }
          if (r >= PI/4) {
            r = PI/4;
            xVel = 0.3535;
            yVel = 0.3535;
          }
        }
        if (x >= 650 && x < 925) {
          xVel = 0;
          yVel = 0;
          if (r > 0) {
            status = "Taxi Refuel 16R";
            r = r - radians(0.5);
          }
          if (r <= 0) {
            r = 0;
            if (x < 925) {
              xVel = 0.5;
            }
          }
        }
        if (x >= 925) {
          xVel = 0;
          yVel = 0;
          x = 925;
          if (r < HALF_PI) {
            status = "Taxi Refuel";
            r = r + radians(0.5);
          }
          if (r >= HALF_PI) {
            r = HALF_PI;
            if (y < 1000) {
              yVel = 0.5;
            }
            if (y >= 1000) {
              yVel = 0;
              reset = true;
            }
          }
        }
      }
    }
  }

  void turnAround() {
    if (reset) {
      if (taxiToFuel) {
        time = millis();
        time = round(time/1000);
        neededFuel = 2*(100 - fuel);
        taxiToFuel = false;
      }
      timeSec = int((time+neededFuel));
      timeSec = timeSec - int(ceil(millis()/1000));
      fuel = 100 - 0.5*timeSec;
      timeMin = ceil((timeSec/60));
      status = "Refueling: " + timeMin + ":" + (timeSec-(timeMin*60)) ;
      if ((timeSec-(timeMin*60))<10) {
        status = "Refueling: " + timeMin + ":0" + (timeSec-(timeMin*60)) ;
      }
      if (timeSec<=0) {
        if (timeMin<=0) {
          clearedTaxiR = true;
        }
      }
    }
  }
}
