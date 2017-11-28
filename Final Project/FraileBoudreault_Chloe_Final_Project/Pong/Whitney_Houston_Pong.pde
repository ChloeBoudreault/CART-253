//NEW!!!!
// WhitneyHoustonPong
//
// This is exactly the same as BasicPong except that the players
//experience one of Whitney Houston's famous song screeching in the 
//background. All in all, it's a very enjoyable experience.

class WhitneyHoustonPong {

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

  //CHANGED!!!!  
  // creating Minim class to handle sound tasks
  Minim minim;
  //and another class for the sound file
  AudioPlayer iWillAlwaysLoveYou;

  //CHANGED!!!!
  //added heart images
  PImage imgHeart;
  PImage imgHeartCrown;

  // Creates the paddles and ball
  WhitneyHoustonPong(PApplet processing) {
    // Create a paddle on either side of the screen
    leftPaddle = new Paddle(PADDLE_INSET, height/2, '2', 'q');
    rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

    // Create the ball at the centre of the screen
    ball = new Ball(width/2, height/2);
    //CHANGED!!!!
    //created second ball
    ball2 = new Ball(width - (width/4), height - (height/4));

    //CHANGED!!!!!
    //loading the song by creating a new SoundFile 
    //and giving it the path to the file
    //we make the Minim manager class into an object
    minim = new Minim (processing);
    //load the song
    iWillAlwaysLoveYou = minim.loadFile ("tone02.mp3");
    
    //CHANGED!!!
    //loading and resizing the big heart image
    imgHeart = loadImage ("Heart.png");
    imgHeart.resize (230,230);
    
    //loading and resizing the crown of hearts image
    imgHeartCrown = loadImage ("HeartCrown.png");
    imgHeartCrown.resize (350,150);
    
  }

    //}n order to know when the program should run the song
    //which is when the user chooses the Whitney Houston Pong game
    //in the menu
    void startGame () {
      //loop the song as long as the
      //player is on the game
      iWillAlwaysLoveYou.loop();
    }

    // update()
    //
    // Handles all the magic of making the paddles and ball move, checking
    // if the ball has hit a paddle, and displaying everything.

    void update() {
      // Fill the background each frame so we have animation
      background(backgroundColor);
      //CHANGED!!!!
      //added the images and their position on the screen.
      image (imgHeart, width/2-110, height/2-60);
      image (imgHeartCrown, width/2-165, height/2-160);
      

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
        //CHANGED!!!!!!
        //added this so the program knows when to stop playing 
        //the song, which is when the user presses 'm' or 'M' to
        //go back to the menu
        iWillAlwaysLoveYou.pause();
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