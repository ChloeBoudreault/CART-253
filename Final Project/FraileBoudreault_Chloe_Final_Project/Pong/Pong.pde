//Artist's Statement
//For my final project I decided to create a series of mini Pong games based
//on the original Pong code. Each of the games are different yet similar in the way
//that they are all quite ridiculous and strange, perhaps even useless. I came up with 
//these ideas off the top of my head, generating the most ridiculous Pong games I could 
//come up with. I didn’t want to do anything too difficult due to my low level of programming 
//knowledge but I did manage to incorporate many aspects and coding techniques that we saw in 
//class such as arrays, functions, sound and minim libraries etc. The main reason behind these 
//ridiculous Pong games is that I wanted to make people laugh, to allow people to take a break 
//and have fun in the most useless and simple way. My favourite out of all these games in the 
//Whitney Houston Pong game because it’s completely ridiculous and makes no sense. Working with 
//arrays was probably the most annoying part and in the end I came up with a result which is quite 
//chaotic however has quite an nice pattern (More Balls the Merrier), the main reason why I decided 
//to leave it that way. One of my favourite part of the game is also the titles. They might not be 
//catchy but that’s the whole point, they’re long and ridiculous. When someone plays Michael Jackson Pong, 
//the first thing they’re going to think about is a Michael Jackson song playing or iconic Michael Jackson 
//sound effects, however, it’s something completely different, it’s simply a ball going black and white 
//and white and black etc. The titles are also quite charming in their own way, they’re annoying to say and 
//I found it quite entertaining to imagine someone asking a friend “Hey wanna play Size Doesn’t Matter in Pong?”. 
//All in all, I just wanted to make strange Pong games in order to make people laugh, might not work as well I as hope
//but it did work on me at least.

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*;

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
    //CHANGED!!!
    //added pong options below
    INVISIBLE_PONG, 
    MICHAEL_JACKSON_PONG, 
    UNFAIR_OR_USELESS_PONG, 
    ITSY_BITSY_PONG, 
    SIZE_DOESNT_MATTER_IN_PONG, 
    MONKEY_PONG, 
    PATRIOTIC_PONG, 
    UNFAIR_PONG_THE_SEQUEL, 
    HOPE_YOU_LIKE_COLOURS_PONG, 
    WHITNEY_HOUSTON_PONG, 
    MORE_BALLS_THE_MERRIER_PONG
}
// This is the variable that actually tracks the state in the game
State state;

// Now we create variables to store the different objects that
// represent the different states of the game
Title title;
Menu menu;
BasicPong basicPong;
BluePong bluePong;
//CHANGED!!!!!
//added pong variables below
InvisiblePong invisiblePong;
MichaelJacksonPong michaelJacksonPong;
UnfairOrUselessPong unfairOrUselessPong;
ItsyBitsyPong itsyBitsyPong;
SizeDoesntMatterInPong sizeDoesntMatterInPong;
MonkeyPong monkeyPong;
PatrioticPong patrioticPong;
UnfairPongTheSequel unfairPongTheSequel;
HopeYouLikeColoursPong hopeYouLikeColoursPong;
WhitneyHoustonPong whitneyHoustonPong;
MoreBallsTheMerrierPong moreBallsTheMerrierPong;

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
  //CHANGED!!!!!
  //added pong states below
  invisiblePong = new InvisiblePong();
  michaelJacksonPong = new MichaelJacksonPong();
  unfairOrUselessPong = new UnfairOrUselessPong();
  itsyBitsyPong = new ItsyBitsyPong();
  sizeDoesntMatterInPong = new SizeDoesntMatterInPong();
  monkeyPong = new MonkeyPong();
  patrioticPong = new PatrioticPong(this);
  unfairPongTheSequel = new UnfairPongTheSequel();
  hopeYouLikeColoursPong = new HopeYouLikeColoursPong();
  whitneyHoustonPong = new WhitneyHoustonPong(this);
  moreBallsTheMerrierPong = new MoreBallsTheMerrierPong();

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

    //CHANGED!!!!!
    // If our state is INVISIBLE_PONG we do all the same things,
    // but for the invisiblePong object instead
  case INVISIBLE_PONG:
    invisiblePong.update();
    if (invisiblePong.returnToMenu) {
      state = State.MENU;
      invisiblePong.returnToMenu = false;
      invisiblePong.reset();
    }
    break;

    //CHANGED!!!!!
    // If our state is MICHAEL_JACKSON_PONG we do all the same things,
    // but for the michaelJacksonPong object instead
  case MICHAEL_JACKSON_PONG:
    michaelJacksonPong.update();
    if (michaelJacksonPong.returnToMenu) {
      state = State.MENU;
      michaelJacksonPong.returnToMenu = false;
      michaelJacksonPong.reset();
    }
    break;

    //CHANGED!!!!!
    // If our state is UNFAIR_OR_USELESS_PONG we do all the same things,
    // but for the unfairOrUselessPong object instead
  case UNFAIR_OR_USELESS_PONG:
    unfairOrUselessPong.update();
    if (unfairOrUselessPong.returnToMenu) {
      state = State.MENU;
      unfairOrUselessPong.returnToMenu = false;
      unfairOrUselessPong.reset();
    }
    break;

    //CHANGED!!!!!
    // If our state is ITSY_BITSY_PONG we do all the same things,
    // but for the itsyBitsyPong object instead
  case ITSY_BITSY_PONG:
    itsyBitsyPong.update();
    if (itsyBitsyPong.returnToMenu) {
      state = State.MENU;
      itsyBitsyPong.returnToMenu = false;
      itsyBitsyPong.reset();
    }
    break;

    //CHANGED!!!!!
    // If our state is SIZE_DOESNT_MATTER_IN_PONG we do all the same things,
    // but for the sizeDoesntMatterInPong object instead
  case SIZE_DOESNT_MATTER_IN_PONG:
    sizeDoesntMatterInPong.update();
    if (sizeDoesntMatterInPong.returnToMenu) {
      state = State.MENU;
      sizeDoesntMatterInPong.returnToMenu = false;
      sizeDoesntMatterInPong.reset();
    }
    break;

    //CHANGED!!!!!
    // If our state is MONKEY_PONG we do all the same things,
    // but for the monkeyPong object instead
  case MONKEY_PONG:
    monkeyPong.update();
    if (monkeyPong.returnToMenu) {
      state = State.MENU;
      monkeyPong.returnToMenu = false;
      monkeyPong.reset();
    }
    break;

    //CHANGED!!!!!
    // If our state is PATRIOTIC_PONG we do all the same things,
    // but for the patrioticPong object instead
  case PATRIOTIC_PONG:
    patrioticPong.update();
    if (patrioticPong.returnToMenu) {
      state = State.MENU;
      patrioticPong.returnToMenu = false;
      patrioticPong.reset();
    }
    break;  

    //CHANGED!!!!!
    // If our state is UNFAIR_PONG_THE_SEQUEL we do all the same things,
    // but for the unfairPongTheSequel object instead
  case UNFAIR_PONG_THE_SEQUEL:
    unfairPongTheSequel.update();
    if (unfairPongTheSequel.returnToMenu) {
      state = State.MENU;
      unfairPongTheSequel.returnToMenu = false;
      unfairPongTheSequel.reset();
    }
    break;  

    //CHANGED!!!!!
    // If our state is HOPE_YOU_LIKE_COLOURS_PONG we do all the same things,
    // but for the hopeYouLikeColoursPong object instead
  case HOPE_YOU_LIKE_COLOURS_PONG:
    hopeYouLikeColoursPong.update();
    if (hopeYouLikeColoursPong.returnToMenu) {
      state = State.MENU;
      hopeYouLikeColoursPong.returnToMenu = false;
      hopeYouLikeColoursPong.reset();
    }
    break;

    //CHANGED!!!!!
    // If our state is WHITNEY_HOUSTON_PONG we do all the same things,
    // but for the  whitneyHoustonPong object instead
  case WHITNEY_HOUSTON_PONG:
    whitneyHoustonPong.update();
    if (whitneyHoustonPong.returnToMenu) {
      state = State.MENU;
      whitneyHoustonPong.returnToMenu = false;
      whitneyHoustonPong.reset();
    }
    break;

    //CHANGED!!!!!
    // If our state is MORE_BALLS_THE_MERRIER_PONG we do all the same things,
    // but for the  moreBallsTheMerrierPong object instead
  case MORE_BALLS_THE_MERRIER_PONG:
    moreBallsTheMerrierPong.update();
    if (moreBallsTheMerrierPong.returnToMenu) {
      state = State.MENU;
      moreBallsTheMerrierPong.returnToMenu = false;
      moreBallsTheMerrierPong.reset();
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

    //CHANGED!!!!
    //added new pongs keypressed below
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

  case UNFAIR_PONG_THE_SEQUEL:
    unfairPongTheSequel.keyPressed();
    break;

  case HOPE_YOU_LIKE_COLOURS_PONG:
    hopeYouLikeColoursPong.keyPressed();
    break;

  case WHITNEY_HOUSTON_PONG:
    whitneyHoustonPong.keyPressed();
    break;
    
  case MORE_BALLS_THE_MERRIER_PONG:
  moreBallsTheMerrierPong.keyPressed();
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

    //CHANGED!!!!
    //added new pongs keyreleased below
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

  case UNFAIR_PONG_THE_SEQUEL:
    unfairPongTheSequel.keyReleased();
    break;

  case HOPE_YOU_LIKE_COLOURS_PONG:
    hopeYouLikeColoursPong.keyReleased();
    break;

  case WHITNEY_HOUSTON_PONG:
    whitneyHoustonPong.keyReleased();
    break;
    
  case MORE_BALLS_THE_MERRIER_PONG:
  moreBallsTheMerrierPong.keyReleased();
  break;
  }
}