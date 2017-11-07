class InvisiblePong {
  
  Paddle leftPaddle;
  Paddle rightPaddle;
  Ball ball;
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

  // BasicPong()
  //
  // Creates the paddles and ball

    InvisiblePong() {
     // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, '2', 'q');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2);
    ball2 = new Ball(width - (width/4), height - (height/4));
  }

  // update()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.

  void update() {
    // Fill the background each frame so we have animation
    background(backgroundColor);
    ball.ballColor = 14;
    ball2.ballColor = 14;

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    ball2.update();

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);
    ball2.collide(leftPaddle);
    ball2.collide(rightPaddle);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }

    if (ball2.isOffScreen()) {
      // If it has, reset the ball
      ball2.reset();
    }
    
    // Display the paddles and the ball
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    ball2.display();
    displayScore();
  }
  
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