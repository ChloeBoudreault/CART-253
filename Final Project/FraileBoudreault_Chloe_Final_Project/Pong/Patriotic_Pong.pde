//NEW!!!! (in progress though)
// PatrioticPong
//
// This is exactly the same as BasicPong except that the background is
//the flag of Canada and every time the balls hit the paddles, someone's voice
//saying "I'm Sorry" plays. Honestly I have no idea what this Pong game is
//besides being ridiculous and basically a stereotype of Canada perhaps.

class PatrioticPong {

  // Variables to store the main objects in the game (the paddles and ball)
  Paddle leftPaddle;
  Paddle rightPaddle;
  Ball ball;
  //CHANGED!!!!
  //second ball
  Ball ball2;

  // The distance from the edge of the window a paddle should be
  int PADDLE_INSET = 8;

  //CHANGED!!!!
  //creating PImage to make the backgound a specific image
  PImage bg;

  // A boolean to track whether we should return to the menu
  boolean returnToMenu = false;

  //CHANGED!!!!!!!!
  //added score for left and right players
  int score1 = 0;
  int score2 = 0;

  //CHANGED!!!!
  //added soundFile array to store the sound file
  //so far only one
  SoundFile[] tones = new SoundFile [1];
  int framesPerBeat = 15;

  // Creates the paddles and ball

  PatrioticPong(PApplet processing) {
    // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, '2', 'q');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2);
    //CHANGED!!!!
    //created second ball
    ball2 = new Ball(width - (width/4), height - (height/4));

    //CHANGED!!!!
    //loading the Canada flag image into the game
    //resizing it so it fits the screen
    bg = loadImage("CanadaFlag.png");
    bg.resize(640, 480);

    // CHANGED!!!!
    // added for-loop to go through the lenght of the array
    //in order to add new objects to it
    for (int i = 0; i < tones.length; i++) {
      //Use the i variable to work out which filename to use
      //So far there's only one sound file, adding more if need be
      tones[i] = new SoundFile (processing, "tone0" + (i+1) + ".mp3");
    }
  }

  // update()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.

  void update() {
    // Fill the background each frame so we have animation
    //CHANGED!!!!
    //background in now the flag of Canada
    background(bg);

    //CHANGED!!!!
    //colour change so we can see the balls
    ball.ballColor = 0;
    ball2.ballColor = 0;

    //CHANGED!!!!!
    //play the sound file
    //if (frameCount % framesPerBeat == 0) {

    //}

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    //CHANGED!!!
    //second ball update
    ball2.update();

    //CHANGED!!!!!
    //added the sound here so that when the balls 
    //collide with either the left or right paddles,
    //the sound starts playing
    // Check if the ball has collided with either paddle
    if (ball.collide(leftPaddle)) {
      int randomIndex = floor (random (0, tones.length));
      tones [randomIndex].play();
    }
    if (ball.collide(rightPaddle)) {
      int randomIndex = floor (random (0, tones.length));
      tones [randomIndex].play();
    }
    //CHANGED!!!
    //second ball collide with both paddles
    if (ball2.collide(leftPaddle)) {
      int randomIndex = floor (random (0, tones.length));
      tones [randomIndex].play();
    }
    if (ball2.collide(rightPaddle)) {
      int randomIndex = floor (random (0, tones.length));
      tones [randomIndex].play();
    }

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
    fill(0);
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