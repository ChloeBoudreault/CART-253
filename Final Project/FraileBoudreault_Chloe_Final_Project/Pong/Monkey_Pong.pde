//NEW!!!!
// MonkeyPong
//
// This is exactly the same as BasicPong except that it has a two
// new paddles. They don't move or have any score but they allow
//users to gain more or less points.

class MonkeyPong {

  // Variables to store the main objects in the game (the paddles and ball)
  Paddle leftPaddle;
  Paddle rightPaddle;
  //CHANGED!!!!
  //new paddles
  Paddle topPaddle;
  Paddle bottomPaddle;
  Ball ball;
  //CHANGED!!!!
  //second ball
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

  // Creates the paddles and ball

  MonkeyPong() {
    // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, '2', 'q');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');
    //CHANGED!!!!!
    //create two new paddles on bottom and top of the screen
    bottomPaddle = new Paddle (width/2, height - 35, '6', 'y');
    topPaddle = new Paddle (width/2, height - 450, '5', 'b');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2);
    //CHANGED!!!!
    //create second ball
    ball2 = new Ball(width - (width/4), height - (height/4));
  }

  // update()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.

  void update() {
    // Fill the background each frame so we have animation
    background(backgroundColor);

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    //CHANGED!!!!
    //two new paddle updates
    topPaddle.update();
    bottomPaddle.update();
    ball.update();
    //CHANGED!!!!!
    //ball 2 update
    ball2.update();

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

    //CHANGED!!!
    //second ball collide with both paddles on 
    //either side of the screen
    ball2.collide(leftPaddle);
    ball2.collide(rightPaddle);

    //CHANGED!!!!
    //first ball collide with the paddle
    //at the bottom of the screen
    ball.collide(bottomPaddle);
    ball.collide(bottomPaddle);

    //CHANGED!!!!
    //second ball collide with the paddle
    //at the bottom of the screen
    ball2.collide(bottomPaddle);
    ball2.collide(bottomPaddle);

    //CHANGED!!!!
    //first ball collide with the paddle
    //at the top of the screen
    ball.collide(topPaddle);
    ball.collide(topPaddle);

    //CHANGED!!!!
    //second ball collide with the paddle
    //at the top of the screen
    ball2.collide(topPaddle);
    ball2.collide(topPaddle);

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
    //CHANGED!!!!
    //top and bottom paddles display
    topPaddle.display();
    bottomPaddle.display();
    ball.display();
    //CHANGED!!!!
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
    //CHANGED!!!!
    //two new paddles reset
    topPaddle.reset();
    bottomPaddle.reset();
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
      //CHANGED!!!!
      //added these because the scores
      //remained the same everytime I would return to menu and come back
      //this is so every time the users play a game and decide
      //to return to it later on, the score will go back to 0 every time
      leftPaddle.score = 0;
      rightPaddle.score = 0;
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