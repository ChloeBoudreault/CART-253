//NEW!!!!
// MichaelJacksonPong
//
// This is exactly the same as BasicPong except that the ball changes
//colour based on its x and y position on the screen. At some points,
//it will change from white to a shade close to blakc (not completely
//black otherwise the players won't see it at all). The changes in
//colour will act as if the ball is appearing and disappearing around 
//the screen making it perhaps harder to the players to keep up with
//it.

class MichaelJacksonPong {

  Paddle leftPaddle;
  Paddle rightPaddle;
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

  MichaelJacksonPong () {
    // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, '2', 'q');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2);
    //CHANGED!!!!
    //created second ball
    ball2 = new Ball(width - (width/4), height - (height/4));
  }

  // update()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.

  void update() {
    // Fill the background each frame so we have animation
    background(backgroundColor);
    //CHANGED!!!!
    //calling function which changes the colour of the ball
    ballColorChange();

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

  //CHANGED!!!!!
  //added function which changes colour the colour of the ball
  //based on its x and y position on the screen
  void ballColorChange () {
    if (ball.x < (width/2+70) && ball.y < (height/2-150)) {
      ball.ballColor = 14;
      ball2.ballColor = 255;
    } else if (ball.x < (width/2+190) && ball.y < (height/2-143)) {
      ball.ballColor = 255;
      ball2.ballColor = 14;
    } else if (ball.x > (width/2-10) && ball.y < (height/2+30)) { 
      ball.ballColor = 14;
      ball2.ballColor = 255;
    } else if (ball.x > (width/2-55) && ball.y < (height/2+349)) {
      ball.ballColor = 255;
      ball2.ballColor = 14;
    } else if (ball.x < (width/2-200) && ball.y > (height/2-120)) { 
      ball.ballColor = 14;
      ball2.ballColor = 255;
    } else if (ball.x < (width/2-168) && ball.y > (height/2-87)) {
      ball.ballColor = 255;
      ball2.ballColor = 14;
    } else if (ball.x > (width/2+64) && ball.y > (height/2+55)) { 
      ball.ballColor = 14;
      ball2.ballColor = 255;
    } else if (ball.x > (width/2+217) && ball.y > (height/2+184)) {
      ball.ballColor = 255;
      ball2.ballColor = 14;
    }
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