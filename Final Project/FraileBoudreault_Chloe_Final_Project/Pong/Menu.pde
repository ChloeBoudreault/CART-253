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
    textSize(32);
    text("1. PONG", width/2, 50);
    text("2. BLUE PONG", width/2, 100);
    text("3. INVISIBLE PONG", width/2, 150);
    text("4. MICHAEL JACKSON PONG", width/2, 200);
    text("5. UNFAIR OR USELESS PONG", width/2, 250);
    text("6. ITSY BITSY PONG", width/2, 300);
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
    }
  }

  // keyReleased()
  //
  // Does nothing.

  void keyReleased() {
  }
}