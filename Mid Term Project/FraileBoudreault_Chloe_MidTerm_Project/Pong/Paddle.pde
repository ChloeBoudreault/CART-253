// Paddle
//
// A class that defines a paddle that can be moved up and down on the screen
// using keys passed through to the constructor.

class Paddle {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 5;
  int HEIGHT = 70;
  int WIDTH = 16;
  //CHANGED!!!!!!
  //add the actual score variable to keep track
  int score = 0;

  // The position and velocity of the paddle (note that vx isn't really used right now)
  int x;
  int y;
  int vx;
  int vy;
  
  // The fill color of the paddle
  color paddleColor = color(255);

  // The characters used to make the paddle move up and down, defined in constructor
  char upKey;
  char downKey;
  
  //CHANGED!!!!!
  //added a mouse control to change the way the player controls the game
  //the player will be able to control the paddle(s) using their mouse
  boolean mouseControl;


  /////////////// Constructor ///////////////

  // Paddle(int _x, int _y, char _upKey, char _downKey)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  //CHANGED!!!!!
  //added the boolean argument into the Paddle
  Paddle(int _x, int _y, char _upKey, char _downKey, boolean assumeControl) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    upKey = _upKey;
    downKey = _downKey;
    
    mouseControl = assumeControl;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update position with velocity (to move the paddle)
    x += vx;
    y += vy;

    // Constrain the paddle's y position to be in the window
    y = constrain(y,0 + HEIGHT/2,height - HEIGHT/2);
    
    //CHANGED!!!!!
    //added the details regarding the boolean into the update function
    //if the mouseControl is used, then the player will be able to use the mouse
    //instead of the keys in order to move the paddle(s)
    if (mouseControl) {
      y = height - mouseY;
    } else {
      y += vy;
    }
    
  }

  // display()
  //
  // Display the paddle at its location
  
  void display() {
    // Set display properties
    //CHANGED!!!!
    //changed the way the paddles look
    //more rounded and with an outline
    stroke(255,105,180);
    strokeWeight (3);
    fill(paddleColor);
    rectMode(CENTER);
    
    // Draw the paddle as a rectangle
    rect(x, y, WIDTH, HEIGHT,7);
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program
  
  void keyPressed() {
    // Check if the key is our up key
    if (key == upKey) {
      // If so we want a negative y velocity
      vy = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
      // If so we want a positive y velocity
      vy = SPEED;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (key == upKey && vy < 0) {
      // If so it should stop
      vy = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == downKey && vy > 0) {
      // If so it should stop
      vy = 0;
    }
  }
}