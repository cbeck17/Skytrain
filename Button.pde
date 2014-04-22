//----------------------------------------------------------
// Skytrain Button PDE Subfile - CS110H Spring 2014 Final Project
// C4C Beck, Christopher; M3H
//
// Inherits: None
//
// Inherited by: None
//
// Purpose: This is just a generic button class I made because I got
// sick of making buttons all the time. Buttons are used within
// many different other classes.
//----------------------------------------------------------


class Button {

  String buttonType;
  int x, y;

  Button(int tempX, int tempY, String tempType) {
    x = tempX;
    y = tempY;
    buttonType = tempType;
  }

  void display() {
    fill(#FBFF1F);
    textFont(createFont("Arial", 24, true)); //Choosing text
    text(buttonType, x+(textWidth(buttonType)/2)+4, y+24);
    fill(0, 0, 255, 50);
    if (over()) {
      fill(0, 0, 255, 150);
    }
    rect(x, y, textWidth(buttonType)+8, 28);
  }

  boolean over() {
    if (mouseX > x && mouseX < x+textWidth(buttonType)+8 && mouseY > y && mouseY < y+28) {
      return true;
    } 
    else {
      return false;
    }
  }
  
  boolean clicked() {
    if (over() && mousePressed) {
    return true;
    }
    else {
      return false;
    }
  }
  
}
