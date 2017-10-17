// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
//CHANGED!!!!!!
//added another paddle in the middle for a third player or someone who has 3 hands
Paddle middlePaddle;
//CHANGED!!!!!!
//adding another ball
Ball ball;
Ball ball2;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

//CHANGED!!!!!
//added random background colour depending on where the ball is on the screen
color colour1BG = color(58, 143, 153); 
color colour2BG = color(172, 195, 14); 
color colour3BG = color(253, 171, 64); 
color colour4BG = color(181, 5, 85); 

//CHANGED!!!!!
//added static as well
int numStatic = 1000;
int staticSizeMin = 2;
int staticSizeMax = 3;
color staticColor = color(200);

//CHANGED!!!!!!!!
//added score for left and right players
int score1 = 0;
int score2 = 0;
int score3 = 0;
//added final winning score
int winningScore = 7;

//CHANGED!!!!
//added a little theme song, from the tv show Schitt's Creek
import processing.sound.*;
SoundFile file;

//CHANGED!!!!!
//added images for when each player wins
PImage leftPlayerCat;
PImage rightPlayerCat;
PImage middlePlayerCat;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  //CHANGED!!!!!
  //loaded the image so they actually appear into the program
  leftPlayerCat = loadImage ("leftPlayerWins.png");
  rightPlayerCat = loadImage ("rightPlayerWins.png");
  middlePlayerCat = loadImage ("middlePlayerWins.png");

  //CHANGED!!!!!
  //added the audio so it plays while playing the game
  file = new SoundFile (this, "Pong_Theme.mp3");
  file.play();

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  //CHANGED!!!!!
  //changed the controls once more, adding the boolean
  //the paddles with false do not use the mouse control
  //the middle paddle will now be control with the mouse
  //CHANGED!!!!!
  //changed the leftPaddle keys to 2 and q instead of 1 and q
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '2', 'q', false);
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p', false);
  //CHANGED!!!!!!
  //added the middle paddle, its position as well as controls
  middlePaddle = new Paddle (width/2, height - 70, '6', 'y', true);


  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  //CHANGED!!!!!
  //added the new ball at another position on the screen
  ball2 = new Ball(width - (width/4), height - (height/4));
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  //CHANGED!!!!!
  //add the ball background colour so it changes every time
  ball.colourBG ();
  //CHANGED!!!!
  //added the ball 2 background colour so it changes as well
  ball2.colourBG ();

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  //CHANGED!!!!!!
  //added middle paddle update
  middlePaddle.update();
  ball.update();
  //CHANGED!!!!
  //adding ball 2 update
  ball2.update();
  //CHANGED!!!!
  //added drawStatic
  drawStatic();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
  //CHANGED!!!!!!
  //added ball collide with middle paddle as well
  ball.collide(middlePaddle);
  //CHANGED!!!!!
  //adding ball 2 collide will all paddles
  ball2.collide(leftPaddle);
  ball2.collide(rightPaddle);
  ball2.collide(middlePaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset();
  }

  //CHANGED!!!!
  //adding the same for ball 2
  if (ball2.isOffScreen()) {
    // If it has, reset the ball
    ball2.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  //CHANGED!!!!!!
  //added middle paddle display
  middlePaddle.display();
  ball.display();
  //CHANGED!!!!!!
  //added ball 2 display
  ball2.display();
  //CHANGED!!!!!!!!
  //display the score based on how many times the ball hits the paddle
  displayScore ();
  //CHANGED!!!!!!
  //will display the game over screen when a player wins
  gameOver();
}

//CHANGED!!!!!!!!
//create displayScore function to actually display the score
void displayScore () {
  textSize (50);
  textAlign (CENTER);
  fill(255);
  //works with the paddle and ball
  text (leftPaddle.score, width/4, 78);
  text (rightPaddle.score, width - (width/4), 78);
  //CHANGED!!!!
  //added middle paddle score
  text (middlePaddle.score, width/2, 78);
}

//CHANGED!!!!!!
//create gameOver function to actually display the game over screen
void gameOver () {
  //if the left paddle (left player)'s score equals the winning score of 7,
  //they win
  if (leftPaddle.score == winningScore) {
    //they win, this displays the "Left Player Wins!" string
    displayGameOver ("");
    //CHANGED!!!!
    //added the image for when the left player wins and resized it
    image(leftPlayerCat, width/4, height/4);
    leftPlayerCat.resize (0, 220);
    //the ball stops moving
    ball.vx = 0;
    ball. vy = 0;
    //CHANGED!!!!
    //added ball 2 vx and vy
    ball2. vx = 0;
    ball2. vy = 0;

    //the paddles stop moving too
    leftPaddle.vx = 0;
    leftPaddle.vy = 0;
    rightPaddle.vx = 0;
    rightPaddle.vy = 0;
    //CHANGED!!!!!
    //added middle paddle
    //middlePaddle.vx = 0;
    //middlePaddle.vy = 0;
    //CHANGED1!!!!
    //added the middlePaddle mouse control so it stops when a player wins
    middlePaddle.mouseControl = false;
  }

  //if the right paddle (right player)'s score equals the winning score of 7,
  //they win
  if (rightPaddle.score == winningScore) {
    //they win, this displays the "Right Player Wins!" string
    displayGameOver ("!");
    //CHANGED!!!!
    //added the image for when the right player wins and resized it
    image(rightPlayerCat, width/4, height/4);
    rightPlayerCat.resize (0, 220);
    //the ball stops moving
    ball.vx = 0;
    ball. vy = 0;
    //CHANGED!!!!
    //added ball 2 vx and vy
    ball2. vx = 0;
    ball2. vy = 0;

    //the paddles stop moving too
    leftPaddle.vx = 0;
    leftPaddle.vy = 0;
    rightPaddle.vx = 0;
    rightPaddle.vy = 0;
    //CHANGED!!!!!
    //added middle paddle
    //middlePaddle.vx = 0;
    //middlePaddle.vy = 0;
    //CHANGED1!!!!
    //added the middlePaddle mouse control so it stops when a player wins
    middlePaddle.mouseControl = false;
  }

  //CHANGED!!!!!!
  //added the middle paddle scoring as well
  //if the middle paddle (middle player)'s score equals the winning score of 7,
  //they win
  if (middlePaddle.score == winningScore) {
    //they win, this displays the "Middle Player Wins!" string
    displayGameOver ("");
    //CHANGED!!!!
    //added the image for when the middle player wins and resized it
    image(middlePlayerCat, width/4, height/4);
    middlePlayerCat.resize (0, 220);
    //the ball stops moving
    ball.vx = 0;
    ball. vy = 0;
    //CHANGED!!!!
    //added ball 2 vx and vy
    ball2. vx = 0;
    ball2. vy = 0;

    //the paddles stop moving too
    leftPaddle.vx = 0;
    leftPaddle.vy = 0;
    rightPaddle.vx = 0;
    rightPaddle.vy = 0;
    //middlePaddle.vx = 0;
    //middlePaddle.vy = 0;
    //CHANGED1!!!!
    //added the middlePaddle mouse control so it stops when a player wins
    middlePaddle.mouseControl = false;
  }
}

//CHANGED!!!!!!
//this function displays the end game text
void displayGameOver (String gameOverText) {
  //this sets the text and its location on the screen
  //CHANGED!!!!
  //changed the height of the game over text so it appears bellow the image
  text ("Game Over!", width/2, height-90);
  text(gameOverText, width/2, (height/2 +50));
  //this sets the font of the text
  PFont myFont;
  myFont = loadFont ("LetterGothicStd-48.vlw");
  textFont (myFont);
}

//CHANGED!!!!!!
//this function displays the static in the background
void drawStatic() {
  //for loop sets up the parameters which define and create the specks of static
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
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
  //CHANGED!!!!
  //added middle paddle keypressed
  //middlePaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
  //CHANGED!!!!
  //added middle paddle keyreleased
  //middlePaddle.keyReleased();
}