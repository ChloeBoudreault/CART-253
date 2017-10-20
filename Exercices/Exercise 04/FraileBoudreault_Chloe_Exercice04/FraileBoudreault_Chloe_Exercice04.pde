// Griddies
// by Pippin Barr
// MODIFIED BY: CHLOE FRAILE-BOUDREAULT
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
//CHANGED!!!
//adding the size of a gruntie and the array to store them all
int gruntSize = 20;
Gruntie[] grunties = new Gruntie[50];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  //this loop creates the amount of griddies in the respective griddies array
  //the griddies will sprout at random locations inside the screen
  //it also sets their size
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }

  //CHANGED!!!!
  //added the loop which creates the amount of grunties in their array
  //the grunties will sprout at random locations inside the screen
  //it also sets their size
  for (int i = 0; i < grunties.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    grunties[i] = new Gruntie(x * gruntSize, y * gruntSize, gruntSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      //this statement check whether or not the j and i griddies are different
      //and if they are different, then it assigns those j and i griddies 
      //to their respective array
      if (j != i) {
        // QUESTION: What does this line check?
        //this checks whether or not the i and j griddies have collided
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
  }

  //CHANGED!!!!
  //we need to loop through all the grunties one by one
  for (int i = 0; i < grunties.length; i++) {

    //Update the grunties
    grunties[i].update();

    //Display the grunties
    grunties[i].display();
  }
}