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
    fill (255);
    background(0);
    textAlign(CENTER, CENTER);
    textSize(25);
    text("1  PONG", width/2, 35);
    text("2  BLUE   PONG", width/2, 65);
    //CHANGED!!!!
    //added the new pong options which will now be visible in the menu
    text("3  INVISIBLE   PONG", width/2, 95);
    text("4  MICHAEL   JACKSON   PONG", width/2, 125);
    text("5  UNFAIR   OR   USELESS   PONG", width/2, 155);
    text("6  ITSY   BITSY   PONG", width/2, 185);
    text("7  SIZE   DOESNT   MATTER   IN   PONG", width/2, 215);
    text("8  MONKEY   PONG", width/2, 245);
    text("9  PATRIOTIC   PONG", width/2, 275);
    text("A  UNFAIR   PONG   THE   SEQUEL", width/2, 305);
    text("B  HOPE   YOU   LIKE   COLOURS   PONG", width/2, 335);
    text("C  WHITNEY  HOUSTON  PONG", width/2, 365);
    text("D  MORE  BALLS  THE  MERRIER  PONG", width/2, 395);
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
      //CHANGED!!!!!
      //new pong games added below, press key to select specific game
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
    } else if (key == 'c' || key == 'C') {
      selection = State.WHITNEY_HOUSTON_PONG;
      //CHANGED!!!!
      //calling the startGame function
      //so the program knows this is when
      //to play the song
      whitneyHoustonPong.startGame();
    } else if (key == 'd' || key == 'D') {
      selection = State.MORE_BALLS_THE_MERRIER_PONG;
    }
  }

  // keyReleased()
  //
  // Does nothing.

  void keyReleased() {
  }
}