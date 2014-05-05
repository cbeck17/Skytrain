//----------------------------------------------------------
// Skytrain Master PDE File - CS110H Spring 2014 Final Project
// C4C Beck, Christopher; M3H
// Documentation: See attached text file.
//----------------------------------------------------------
//        
//          ,--.       /1|                                            ___
// |  ...../_8_|\...../@@|                          _... /|\         /  /
// |-{    .======. USAFA /........................-'\_8o/_|_\_______/AF/
// |  `-/'---\$'--'----''                        '-......-'''''''''''''
//     o     o 
//-----------------------------------------------------------


//Music Stuff
import ddf.minim.*;
AudioPlayer gameplayMusic;
Minim minim;//audio context

//These are for testing purposes only, will be arraylists of objects
Airfield airfield;
TwinOtter twinOtter;
Towplane towplane;
Sailplane sailplane;

void setup() {
  frame.setIconImage( getToolkit().getImage("Skytrain.ico") ); //A lousy attempt to set the game icon... fix later, doesn't work
  imageMode(CENTER);
  size(1000, 600);

  //Music stuff
  minim = new Minim(this);
  gameplayMusic = minim.loadFile("Breaktime.mp3", 2048);
  //gameplayMusic.play();

  //To resize the window
  if (frame != null) {
    frame.setResizable(true);
  }

  //These are for testing purposes (will be moved to the "Controller")
  twinOtter = new TwinOtter(76, -150, HALF_PI);
  towplane = new Towplane(925, 500, -HALF_PI);
  sailplane = new Sailplane(550, -50, HALF_PI);
  airfield = new Airfield();
  twinOtter.clearedToTaxi();

}

void draw() {
  airfield.displayAirfieldBackground();
  
  //For testing purposes only
  twinOtter.control();
  twinOtter.display();
  towplane.control();
  towplane.display();
  sailplane.control();
  sailplane.display();
}
