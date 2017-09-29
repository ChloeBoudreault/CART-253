//defines colour of the background
color backgroundColor = color(0);

//defines the number of, size of, colour of the white moving specks in the background
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

//defines the looks of, speed of, colour of the moving paddle
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

//defines  the looks of, speed of, colour of the moving ball
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);

//this sets up the display window
void setup() {
  //this code initializes the program
  size(640, 480);
  
  //the program jumps to those functions below
  setupPaddle();
  setupBall();
}

//we create the function setupPaddle
//the program will run the code inside then jump back to where it is in draw()
void setupPaddle() {
  //defines the position of the paddle (center and bottom of the screen)
  paddleX = width/2;
  paddleY = height - paddleHeight;
  //paddle velocity at 0 so it stays still when the program opens
  paddleVX = 0;
}

//we create the function setupBall
//the program will run the code inside then jump back to where it is in draw()
void setupBall() {
  //defines the positon and velocity of the ball upon opening the program
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

void draw() {
  //this codes runs the program
  //everything listed here are what will appear and act when the program is run
  background(backgroundColor);

  //the program jumps to those functions below
  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}

//we create the function drawStatic
//the program will run the code inside then jump back to where it is in draw()
void drawStatic() {
  //sets up the parameters which define and create the specks of static in the background
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}

//we create the function updatePaddle
//the program will run the code inside then jump back to where it is in draw()
void updatePaddle() {
  //moves paddle and keeps it from going off screen
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

//we create the function updateBall
//the program will run the code inside then jump back to where it is in draw()
void updateBall() {
  //moves ball
  ballX += ballVX;
  ballY += ballVY;
  
  //create other functions which will allow the ball to move around on the screen
  //without disappearing 
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

//we create the function drawPaddle
//the program will run the code inside then jump back to where it is in draw()
void drawPaddle() {
  //this creates the paddle itself
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

//we create the function drawBall
//the program will run the code inside then jump back to where it is in draw()
void drawBall() {
  //this creates the ball itself
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

//we create the function handleBallHitPaddle
//the program will run the code inside then jump back to where it is in draw()
void handleBallHitPaddle() {
  //this allows the ball to "bounce back" when it hits the paddle
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    //CHANGED!!!!!!!!
    //easiest change to make is to change the speed of the ball when it hits the paddle
    //now, everytime the ball hits the paddle it gets faster
    ballVY = -ballVY-1;
  }
}
  
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

//we create the function handleBallOffBottom
//the program will run the code inside then jump back to where it is in draw()
void handleBallOffBottom() {
  //if the ball hits the bottom of the screen and disappears
  //it will reappear in the middle of the screen
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

//we create the function handleBallHitWall
//the program will run the code inside then jump back to where it is in draw()
void handleBallHitWall() {
  //this allows the ball to "bounce back" when it hits the wall
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

//this allows the user to interact with the game, the paddle will move if a key is pressed
void keyPressed() {
  //if the left key on the keyboard is pressed, the paddle will move to the left
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  //otherwise, if the right key on the keyboard is pressed, the paddle will move to the right
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

//this will stop the paddle from moving when they keys are released
void keyReleased() {
  //if the left key on the keyboard is released, the paddle will stop moving in general
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  //if the right key on the keyboard is released, the paddle will stop moving in general
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}