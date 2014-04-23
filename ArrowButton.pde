
class ArrowButton {

  String runway;
  float x, y;
  boolean active;

  ArrowButton(float tempX, float tempY, String tempRunway) {
    x = tempX;
    y = tempY;
    runway = tempRunway;
    active = true;
  }

  void display() {
    if (active) {
      if (!over() && round(millis()/1000) % 2 == 0) {
        fill(0, 255, 0, 100);
        rect(x, y, 65, 50);
        fill(0, 0, 255, 100);
        beginShape();
        vertex(x+3, y+18);
        vertex(x+40, y+18);
        vertex(x+40, y+5);
        vertex(x+65, y+25);
        vertex(x+40, y+45);
        vertex(x+40, y+32);
        vertex(x+3, y+32);
        endShape(CLOSE);
      }
    }

    if (over()) {
      fill(255, 0, 0, 100);
      rect(x, y, 65, 50);
      fill(0, 0, 255, 100);
      beginShape();
      vertex(x+3, y+18);
      vertex(x+40, y+18);
      vertex(x+40, y+5);
      vertex(x+65, y+25);
      vertex(x+40, y+45);
      vertex(x+40, y+32);
      vertex(x+3, y+32);
      endShape(CLOSE);
    }
  }

  boolean over() {
    if (mouseX > x && mouseX < x+65 && mouseY > y && mouseY < y+50) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean clicked() {
    if (over() && mousePressed && active) {
      return true;
    }
    else {
      return false;
    }
  }

  void activate() {
    active = true;
  }

  void deactivate() {
    active = false;
  }
}
