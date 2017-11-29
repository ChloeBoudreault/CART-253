// BasicPong
//
// This is basically exactly the same implementation of Pong we've already
// seen for the midterm, except that it is defined as a CLASS which can
// be instantiated into an object to run the game.
//
// We now use the constructor BasicPong() to set up the game, instead of
// setup(), and we use update() to update the game, instead of draw().
//
// A new addition is tracking whether the player presses a key ('m') to
// return to the menu. If so, the game remembers they did and the main
// program handles actually changing back to the menu itself.

class MoreBallsTheMerrierPong {

  // Variables to store the main objects in the game (the paddles and ball)
  Paddle leftPaddle;
  Paddle rightPaddle;
  Ball ball;
  //CHANGED!!!!
  //added a second ball to all Pong games
  Ball ball2;

  // The distance from the edge of the window a paddle should be
  int PADDLE_INSET = 8;

  // The background colour during play (black)
  color backgroundColor = color(0);

  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;

  //CHANGED!!!!!!!!
  //added score for left and right players
  int score1 = 0;
  int score2 = 0;

  Ball [] balls = new Ball[100];
  
  // Creates the paddles and ball

  MoreBallsTheMerrierPong() {
    // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, '2', 'q');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2);
    //CHANGED!!!!
    //created second ball
    ball2 = new Ball(width - (width/4), height - (height/4));
    
    for (int i = 0; i < balls.length ; i++) {
    balls[i] = new Ball (floor(random(0,width)), floor(random (0,height)));
 }
  }

  // update()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.

  void update() {
    // Fill the background each frame so we have animation
    background(backgroundColor);
    
    for (int i = 0; i<balls.length; i++) {
    balls[i].update();
    balls[i].display();
    balls[i].collide(leftPaddle);
    balls[i].collide(rightPaddle);
    if (balls[i].isOffScreen()){
    balls[i].reset();
    }
    }
  

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    //CHANGED!!!
    //second ball update
    ball2.update();

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);
    //CHANGED!!!
    //second ball collide with both paddles
    ball2.collide(leftPaddle);
    ball2.collide(rightPaddle);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }

    //CHANGED!!!
    //checks if the second ball has gone off the screen
    if (ball2.isOffScreen()) {
      // If it has, reset the ball
      ball2.reset();
    }

    // Display the paddles and the ball
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    //CHANGED!!!
    //second ball display
    ball2.display();
    //CHANGED!!!!!
    //display the score on screen
    displayScore();
  }

//CHANGED!!!!!
//added displayScore function which willl show the score 
//of each player at the top of the screen
  void displayScore() {
    textSize (50);
    textAlign (CENTER);
    fill(255);
    //works with the paddle and ball
    text (leftPaddle.score, width/4, 78);
    text (rightPaddle.score, width - (width/4), 78);
  }

  // reset()
  //
  // Resets the game by resetting the ball and paddles and setting
  // returnToMenu to false

  void reset() {
    ball.reset();
    //CHANGED!!!!
    //second ball reset
    ball2.reset();
    leftPaddle.reset();
    rightPaddle.reset();
    returnToMenu = false;
  }

  // keyPressed()
  //
  // The paddles need to know if they should move based on a keypress
  // so when the keypress is detected in the main program we need to
  // tell the paddles

  void keyPressed() {
    // Just call both paddles' own keyPressed methods
    leftPaddle.keyPressed();
    rightPaddle.keyPressed();

    // Check if we should return to the menu
    if (key == 'm' || key == 'M') {
      returnToMenu = true;
    }
  }

  // keyReleased()
  //
  // As for keyPressed, except for released!

  void keyReleased() {
    // Call both paddles' keyReleased methods
    leftPaddle.keyReleased();
    rightPaddle.keyReleased();
  }
}