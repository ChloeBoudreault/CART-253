// Pong(s)
// by Pippin Barr
//
// A version of Pong that can run multiple versions of the game.
// Each version is a class and the game is able to show a title screen,
// a menu for selection versions, and the versions themselves.

// An enum is a way to group together a set of named options
// In this case I'm using it for tracking the state the program is in.
enum State {
  NONE, 
    TITLE, 
    MENU, 
    BASIC_PONG, 
    BLUE_PONG, 
    INVISIBLE_PONG, 
    MICHAEL_JACKSON_PONG, 
    UNFAIR_OR_USELESS_PONG, 
    ITSY_BITSY_PONG, 
    SIZE_DOESNT_MATTER_IN_PONG, 
    MONKEY_PONG,
    PATRIOTIC_PONG
}
// This is the variable that actually tracks the state in the game
State state;

// Now we create variables to store the different objects that
// represent the different states of the game
Title title;
Menu menu;
BasicPong basicPong;
BluePong bluePong;
InvisiblePong invisiblePong;
MichaelJacksonPong michaelJacksonPong;
UnfairOrUselessPong unfairOrUselessPong;
ItsyBitsyPong itsyBitsyPong;
SizeDoesntMatterInPong sizeDoesntMatterInPong;
MonkeyPong monkeyPong;
PatrioticPong patrioticPong;

// setup()
//
// Sets the size and creates the various state objects

void setup() {
  // Set the size
  size(640, 480);

  // Create the different states
  title = new Title();
  menu = new Menu();
  basicPong = new BasicPong();
  bluePong = new BluePong();
  invisiblePong = new InvisiblePong();
  michaelJacksonPong = new MichaelJacksonPong();
  unfairOrUselessPong = new UnfairOrUselessPong();
  itsyBitsyPong = new ItsyBitsyPong();
  sizeDoesntMatterInPong = new SizeDoesntMatterInPong();
  monkeyPong = new MonkeyPong();
  patrioticPong = new PatrioticPong();

  // We start our state in the title screen
  state = State.TITLE;
}

// draw()
//
// This uses a "Finite State Machine" (FSM) to run the game
// depending on what state we're in. So if we're in the title state,
// it uses the title object to draw the title etc.

void draw() {
  // A "switch" statement is like an "if" statement with different
  // syntax. Notice how we use "break;" after the instructions for
  // each state are finished.
  switch (state) {
    // If our state is NONE, we do nothing
  case NONE:
    break;

    // If our state is TITLE we update the title object
    // which displays it, and then we check whether the title
    // screen is finished and if so we go to the menu state
  case TITLE:
    title.update();
    if (title.finished) {
      state = State.MENU;
    }
    break;

    // If our state is MENU we update the menu
    // We then check whether anything has been selected
    // in the menu and if so we switch to that state
    // (And reset the menu selection for next time.)
  case MENU:
    menu.update();
    if (menu.selection != State.NONE) {
      state = menu.selection;
      menu.selection = State.NONE;
    }
    break;

    // If our state is BASIC_PONG we update the
    // basicPong object which runs the game and then check whether 
    // the player has chosen to return to the menu. If so we set
    // the state appropriate, and reset the game.
  case BASIC_PONG:
    basicPong.update();
    if (basicPong.returnToMenu) {
      state = State.MENU;
      basicPong.reset();
    }
    break;

    // If our state is BLUE_PONG we do all the same things,
    // but for the bluePong object instead
  case BLUE_PONG:
    bluePong.update();
    if (bluePong.returnToMenu) {
      state = State.MENU;
      bluePong.returnToMenu = false;
      bluePong.reset();
    }
    break;

  case INVISIBLE_PONG:
    invisiblePong.update();
    if (invisiblePong.returnToMenu) {
      state = State.MENU;
      invisiblePong.returnToMenu = false;
      invisiblePong.reset();
    }
    break;

  case MICHAEL_JACKSON_PONG:
    michaelJacksonPong.update();
    michaelJacksonPong.ballColorChange();
    if (michaelJacksonPong.returnToMenu) {
      state = State.MENU;
      michaelJacksonPong.returnToMenu = false;
      michaelJacksonPong.reset();
    }
    break;

  case UNFAIR_OR_USELESS_PONG:
    unfairOrUselessPong.update();
    if (unfairOrUselessPong.returnToMenu) {
      state = State.MENU;
      unfairOrUselessPong.returnToMenu = false;
      unfairOrUselessPong.reset();
    }
    break;

  case ITSY_BITSY_PONG:
    itsyBitsyPong.update();
    if (itsyBitsyPong.returnToMenu) {
      state = State.MENU;
      itsyBitsyPong.returnToMenu = false;
      itsyBitsyPong.reset();
    }
    break;

  case SIZE_DOESNT_MATTER_IN_PONG:
    sizeDoesntMatterInPong.update();
    sizeDoesntMatterInPong.paddleSizeChange();
    if (sizeDoesntMatterInPong.returnToMenu) {
      state = State.MENU;
      sizeDoesntMatterInPong.returnToMenu = false;
      sizeDoesntMatterInPong.reset();
    }
    break;

  case MONKEY_PONG:
    monkeyPong.update();
    if (monkeyPong.returnToMenu) {
      state = State.MENU;
      monkeyPong.returnToMenu = false;
      monkeyPong.reset();
    }
    break;
    
    case PATRIOTIC_PONG:
    patrioticPong.update();
    if (patrioticPong.returnToMenu) {
      state = State.MENU;
      patrioticPong.returnToMenu = false;
      patrioticPong.reset();
    }
    break;  
  }
}

// keyPressed()
//
// Here we just call the keyPressed() method of the appropriate
// object for the state we're in.

void keyPressed() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyPressed();
    break;

  case MENU:
    menu.keyPressed();
    break;

  case BASIC_PONG:
    basicPong.keyPressed();
    break;

  case BLUE_PONG:
    bluePong.keyPressed();
    break;

  case INVISIBLE_PONG:
    invisiblePong.keyPressed();
    break;

  case MICHAEL_JACKSON_PONG:
    michaelJacksonPong.keyPressed();
    break;

  case UNFAIR_OR_USELESS_PONG:
    unfairOrUselessPong.keyPressed();
    break;

  case ITSY_BITSY_PONG:
    itsyBitsyPong.keyPressed();
    break;

  case SIZE_DOESNT_MATTER_IN_PONG:
    sizeDoesntMatterInPong.keyPressed();
    break;
    
  case MONKEY_PONG:
  monkeyPong.keyPressed();
  break;
  
  case PATRIOTIC_PONG:
  patrioticPong.keyPressed();
  break;
  }
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  switch (state) {
  case NONE:
    break;

  case TITLE:
    title.keyReleased();
    break;

  case MENU:
    menu.keyReleased();
    break;

  case BASIC_PONG:
    basicPong.keyReleased();
    break;

  case BLUE_PONG:
    bluePong.keyReleased();
    break;

  case INVISIBLE_PONG:
    invisiblePong.keyReleased();
    break;

  case MICHAEL_JACKSON_PONG:
    michaelJacksonPong.keyReleased();
    break;

  case UNFAIR_OR_USELESS_PONG:
    unfairOrUselessPong.keyReleased();
    break;

  case ITSY_BITSY_PONG:
    itsyBitsyPong.keyReleased();
    break;

  case SIZE_DOESNT_MATTER_IN_PONG:
    sizeDoesntMatterInPong.keyReleased();
    break;
    
  case MONKEY_PONG:
  monkeyPong.keyReleased();
  break;
  
  case PATRIOTIC_PONG:
  patrioticPong.keyReleased();
  break;
  }
}