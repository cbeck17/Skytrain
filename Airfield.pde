//----------------------------------------------------------
// Skytrain Airfield PDE Subfile - CS110H Spring 2014 Final Project
// C4C Beck, Christopher; M3H
//
// Inherits: None
//
// Inherited by: None
//
// Purpose: This object creates the airfield itself. It is primarily
// used to create the airfield background.
//----------------------------------------------------------


class Airfield {
  
  //This method's purpose is very obvious...
  void displayAirfieldBackground() {
    background(0, 128, 0); //Background grass color
    strokeWeight(1);
    fill(51, 204, 51); //SPLA green
    rect(200, 400, 600, 199); //SPLA
    rect(350, 250, 300, 150); //SPLA staging area
    fill(192); //Runway and taxiway gray
    rect(350, 150, 300, 150); //Staging Area
    rect(350, 0, 300, 100); //94th Apron
    rect(50, 250, 900, 50); //Runway 16R background
    rect(50, 100, 900, 50); //Runway 16C background
    rect(55, 150, 40, 100); //16R-C Taxiway background
    rect(55, 0, 40, 100); //16C taxiway
    rect(905, 0, 40, 100); //34C Taxiway background
    rect(905, 150, 40, 100); //34C-L Taxiway background
    rect(905, 300, 40, height-300); //34L taxiway background
    fill(255, 255, 0); //Taxiway line yellow color
    rect(350, 198, 300, 2); //Staging Area Holdshort
    rect(350, 80, 300, 2); //94th Apron Holdshort
    rect(350, 84, 300, 2); //94th Apron Holdshort
    rect(74, 150, 2, 100); //16 Taxiway centerline
    rect(56, 150, 2, 100); //16 Taxiway edgeline
    rect(92, 150, 2, 100); //16 Taxiway edgeline
    rect(74, 0, 2, 100); //16C Taxiway centerline
    rect(56, 0, 2, 100); //16C Taxiway edgeline
    rect(92, 0, 2, 100); //16C Taxiway edgeline
    rect(924, 150, 2, 100); //34 Taxiway centerline
    rect(906, 150, 2, 100); //34 Taxiway edgeline
    rect(942, 150, 2, 100); //34 Taxiway edgeline
    rect(924, 0, 2, 100); //34E Taxiway centerline
    rect(906, 0, 2, 100); //34E Taxiway edgeline
    rect(942, 0, 2, 100); //34E Taxiway edgeline
    rect(924, 300, 2, height-300); //34L Taxiway centerline
    rect(906, 300, 2, height-300); //34L Taxiway edgeline
    rect(942, 300, 2, height-300); //34L Taxiway edgeline
    rect(908, 313, 34, 2); //34L holdshort
    rect(908, 317, 34, 2);
    rect(908, 163, 34, 2);
    rect(908, 167, 34, 2);
    rect(908, 235, 34, 2);
    rect(908, 231, 34, 2);
    rect(908, 84, 34, 2);
    rect(908, 80, 34, 2);
    rect(58, 167, 34, 2);
    rect(58, 163, 34, 2);
    rect(58, 84, 34, 2);
    rect(58, 80, 34, 2);
    rect(58, 231, 34, 2);
    rect(58, 235, 34, 2);
    for (int i = 908; i+6<=943; i=i+14) {
      rect(i, 305, 6, 2);
      rect(i, 308, 6, 2);
      rect(i, 243, 6, 2);
      rect(i, 239, 6, 2);
      rect(i, 155, 6, 2);
      rect(i, 159, 6, 2);
      rect(i, 88, 6, 2);
      rect(i, 92, 6, 2);
      rect(i-850, 159, 6, 2);
      rect(i-850, 155, 6, 2);
      rect(i-850, 239, 6, 2);
      rect(i-850, 243, 6, 2);
      rect(i-850, 92, 6, 2);
      rect(i-850, 88, 6, 2);
    }
    for (int i = 350; i+12<=650; i=i+24) {
      rect(i, 92, 12, 2);
      rect(i, 88, 12, 2);
      rect(i, 194, 12, 2);
      rect(i, 202, 12, 2);
    }
    fill(255, 255, 255); //Line coloring
    for (int i = 135; i + 30 <= 900; i = i+50) { //Making runway centerlines
      rect(i, 272, 30, 6); //16R centerlines
      rect(i, 122, 30, 6); //16C centerlines
    }
    for (int i = 252; i + 3 <= 300; i = i+4) { //Threshold markings
      rect(51, i, 25, 2); //16R threshold markings
      rect(924, i, 25, 2); //34L threshold markings
      rect(51, i-150, 25, 2); //16C threshold markings
      rect(924, i-150, 25, 2); //34C threshold markings
    }
    for (int i = 235; i + 30 <= 800; i = i+50) { //Making runway centerlines
      rect(i, 425, 30, 6); //SPLA 1 centerlines
      rect(i, 475, 30, 6); //SPLA 2 centerlines
      rect(i, 525, 30, 6); //SPLA 3 centerlines
      rect(i, 575, 30, 6); //SPLA 4 centerlines
      stroke(1);
      textFont(createFont("Arial", 20, true)); //Choosing text
      rotate(HALF_PI); // Rotate text
      textAlign(CENTER); //Centering text
      text(16, 275, -107);
      text("R", 275, -87);
      text(16, 125, -107);
      text("C", 125, -87);
      textFont(createFont("Arial", 24, true)); //Choosing text
      text(1, 428, -210);
      text(2, 478, -210);
      text(3, 528, -210);
      text(4, 578, -210);
      textFont(createFont("Arial", 20, true)); //Choosing text
      rotate(PI); //Rotating for 34 orientation
      text(34, -275, 893);
      text("L", -275, 913);
      text(34, -125, 893);
      text("C", -125, 913);
      textFont(createFont("Arial", 24, true)); //Choosing text
      text(1, -429, 790);
      text(2, -479, 790);
      text(3, -529, 790);
      text(4, -579, 790);
      rotate(HALF_PI);
    }
  }
}
