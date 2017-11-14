// Menu
//
// A simple class to display a menu of possible games to play
// and to respond to the player's selection by setting a variable
// that the main program can see and then switch to the selected
// state

class Menu {

  // A variable to track the user's selection (starts as NONE)
  State selection = State.NONE;

  // A constructor that does nothing
  Menu() {
  }

  // update()
  //
  // The update method just displays the menu

  void update() {
    display();
  }

  // display()
  //
  // The display method displays the options available in the game

  void display() {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(25);
    text("1. PONG", width/2, 40);
    text("2. BLUE PONG", width/2, 80);
    text("3. INVISIBLE PONG", width/2, 120);
    text("4. MICHAEL JACKSON PONG", width/2, 160);
    text("5. UNFAIR OR USELESS PONG", width/2, 200);
    text("6. ITSY BITSY PONG", width/2, 240);
    text("7. SIZE DOESN'T MATTER IN PONG", width/2, 280);
    text("8. MONKEY PONG", width/2, 320);
    text("9. PATRIOTIC PONG", width/2, 360);
    text("A. UNFAIR PONG THE SEQUEL", width/2, 400);
    text("B. HOPE YOU LIKE COLOURS PONG", width/2, 440);
  }

  // keyPressed()
  //
  // Called by the main program when the menu is active. If the player
  // presses a key to select one of the game versions, this object
  // will remember the state chosen.

  void keyPressed() {
    if (key == '1') {
      selection = State.BASIC_PONG;
    } else if (key == '2') {
      selection = State.BLUE_PONG;
    } else if (key == '3') {
      selection = State.INVISIBLE_PONG;
    } else if (key == '4') {
      selection = State.MICHAEL_JACKSON_PONG;
    } else if (key == '5') {
      selection = State.UNFAIR_OR_USELESS_PONG;
    } else if (key == '6') {
      selection = State.ITSY_BITSY_PONG;
    } else if (key == '7') {
      selection = State.SIZE_DOESNT_MATTER_IN_PONG;
    } else if (key == '8') {
      selection = State.MONKEY_PONG;
    } else if (key == '9') {
      selection = State.PATRIOTIC_PONG;
    } else if (key == 'a' || key == 'A') {
      selection = State.UNFAIR_PONG_THE_SEQUEL;
    } else if (key == 'b' || key == 'B') {
      selection = State.HOPE_YOU_LIKE_COLOURS_PONG;
    }
  }

  // keyReleased()
  //
  // Does nothing.

  void keyReleased() {
  }
}