//----------------------------------------------------------
// Skytrain Code Purgatory PDE Subfile - CS110H Spring 2014 Final Project
// C4C Beck, Christopher; M3H
//
// Inherits: None
//
// Inherited by: None
//
// Purpose: This is code purgatory. It contains code that I wrote at some
// point that I can not use in the current version of Skytrain,
// but I feel may be useful again someday. Therefore, since I have
// no better place to put it, and I can't really stand looking at tons
// of commented out code in my main project, it resides here in
// code purgatory until I determine that either it is valuable and
// can return to code heaven in a regular PDE file, or whether it
// will be banished to the recycle bin.
//----------------------------------------------------------

// The pearly gates of PDE...
//                         ==                     ==
//                      <^\()/^>               <^\()/^>
//                       \/  \/                 \/  \/
//                        /__\      .  '  .      /__\ 
//           ==            /\    .     |     .    /\            ==
//        <^\()/^>       !_\/       '  |  '       \/_!       <^\()/^>
//         \/  \/     !_/I_||  .  '   \'/   '  .  ||_I\_!     \/  \/
//          /__\     /I_/| ||      -== + ==-      || |\_I\     /__\
//          /_ \   !//|  | ||  '  .   /.\   .  '  || |  |\\!   /_ \
//         (-   ) /I/ |  | ||       .  |  .       || |  | \I\ (=   )
//          \__/!//|  |  | ||    '     |     '    || |  |  |\\!\__/
//          /  \I/ |  |  | ||       '  .  '    *  || |  |  | \I/  \
//         {_ __}  |  |  | ||                     || |  |  |  {____}
//      _!__|= ||  |  |  | ||   *      +          || |  |  |  ||  |__!_
//      _I__|  ||__|__|__|_||          A          ||_|__|__|__||- |__I_
//      -|--|- ||--|--|--|-||       __/_\__  *    ||-|--|--|--||= |--|-
//       |  |  ||  |  |  | ||      /\-'o'-/\      || |  |  |  ||  |  |
//       |  |= ||  |  |  | ||     _||:<_>:||_     || |  |  |  ||= |  |
//       |  |- ||  |  |  | || *  /\_/=====\_/\  * || |  |  |  ||= |  |
//       |  |- ||  |  |  | ||  __|:_:_[I]_:_:|__  || |  |  |  ||- |  | 
//      _|__|  ||__|__|__|_||:::::::::::::::::::::||_|__|__|__||  |__|_
//      -|--|= ||--|--|--|-||:::::::::::::::::::::||-|--|--|--||- |--|-
//       |  |- ||  |  |  | ||:::::::::::::::::::::|| |  |  |  ||= |  | 
//     ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~~~~~~~~~

// Guardian of the recycle bin...
//                                   .""--..______________
//                         _                     []       ``-.._
//                      .'` `'.                  ||__           `-._
//                     /    ,-.\                 ||_ ```---..__     `-.
//                    /    /:::\\               /|//}          ``--._  `.
//                    |    |:::||              |////}                `-. \
//                    |    |:::||             //'///                    `.\
//                    |    |:::||            //  ||'                      `|
//                    /    |:::|/        _,-//\  ||
//                   /`    |:::|`-,__,-'`  |/  \ ||
//                 /`  |   |'' ||           \   |||
//               /`    \   |   ||            |  /||
//             |`       |  |   |)            \ | ||
//            |          \ |   /      ,.__    \| ||
//            /           `         /`    `\   | ||
//           |                     /        \  / ||
//           |                     |        | /  ||
//           /         /           |        `(   ||
//          /          .           /          )  ||
//         |            \          |     ________||
//        /             |          /     `-------.|
//       |\            /          |              ||
//       \/`-._       |           /              ||
//        //   `.    /`           |              ||
//       //`.    `. |             \              ||
//      ///\ `-._  )/             |              ||
//     //// )   .(/               |              ||
//     ||||   ,'` )               /              //
//     ||||  /                    /             || 
//     `\\` /`                    |             // 
//         |`                     \            ||  
//        /                        |           //  
//      /`                          \         //   
//    /`                            |        ||    
//    `-.___,-.      .-.        ___,'        (/    
//             `---'`   `'----'`




//---------------------------------------------------------------------
// File - Skytrain Main PDE File
// Class - N/A
// Method - N/A
// Content - Declarations
// Banished - 17 April 2014
//
// Reason for Exile - These are old declarations that I used in Skytrain
// v1.9 and earlier. No longer useable in the current development version.
//
// Reason not deleted - I might be able to use this code in later
// operative versions of Skytrain.
//
// Outlook: Recycle Bin - I plan to use array lists in future versions
// and not simple arrays.
//---------------------------------------------------------------------
// Airplane[] airplane; //Airplane array declaration
// Towplane[] towplane; //Towplane array declaration
// Sailplane[] sailplane; //Sailplane array declaration
// Location[] sailplaneLocation; //Sailplane location array declaration
// Location[] towplaneLocation; //Towplane location array declaration
// TwinOtter twinOtter; //Twin-otter object declaration
// int nTowplane = 6;  //Number of towplanes
// int nSailplane = 8; //Number of sailplanes
// int sailplaneNDest = 0;
// int towplaneNDest = 0;
//---------------------------------------------------------------------



//---------------------------------------------------------------------
// File - Airplane PDE Subfile
// Class - Airplane
// Method - arraySetup
// Content - Method
// Banished - 17 April 2014
//
// Reason for Exile - This is an old method from the airplane class that
// initializes the different airplane arrays. This is called from the
// setup method.
//
// Reason not deleted - I might be able to use this code in later
// operative versions of Skytrain when I reinstate the arrays. 
//
// Outlook: Recycle Bin - I plan to use array lists in future versions
// and not simple arrays.
//---------------------------------------------------------------------
//  void arraySetup() {
//    airplane = new Airplane[nTowplane + nSailplane + 1];
//    airplane[0] = twinOtter;
//    for (int i = 1; i <= nTowplane; i++) {
//      airplane[i] = towplane[i-1];
//    }
//  }
//---------------------------------------------------------------------



//---------------------------------------------------------------------
// File - Airplane PDE Subfile
// Class - Airplane
// Method - arraySetup
// Content - Method
// Banished - 17 April 2014
//
// Reason for Exile - This is an old method from the airplane class that
// checks to make sure that the plane hasn't crashed
//
// Reason not deleted - I might be able to use this code in later
// operative versions of Skytrain when I complete the more important
// stuff in the airplane class.
//
// Outlook: Heaven - I might revive the code after heavy revision.
//---------------------------------------------------------------------
//  void checkCrash() {
//    for (int i=0; i<nTowplane; i++) {
//      if (abs(x - towplane[i].giveX())<=40 && abs(y - towplane[i].giveY())<=40) {
//        crashed = true;
//        status = "Crashed";
//        towplane[i].setCrash();
//        println("Crash");
//      }
//    }
//    for (int i=0; i<nSailplane; i++) {
//      if (abs(x - sailplane[i].giveX())<=40 && abs(y - sailplane[i].giveY())<=40) {
//        crashed = true;
//        status = "Crashed";
//        sailplane[i].setCrash();
//        println("Crash");
//      }
//    }
//    if (abs(x - twinOtter.giveX())<=40 && abs(y - twinOtter.giveY())<=40 && type != "Twin Otter") {
//      crashed = true;
//      status = "Crashed";
//      twinOtter.setCrash();
//      println("Crash");
//    }
//  }
//---------------------------------------------------------------------
