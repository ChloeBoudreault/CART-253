import processing.sound.*;

//Took the code from the previous exercise, exercise 06
//minus the webcam, video library


// An array of bouncers to play with
Bouncer[] bouncers = new Bouncer[10];
//CHANGED!!!!
//added soundFile array in order to store some sound files
SoundFile[] tones = new SoundFile [1];
// The number of frames per beat of music
int framesPerBeat = 15;

// setup()
//
// Creates the bouncers and starts the webcam

void setup() {
  size(640, 480);

  // Our old friend the for-loop used to go through the length of an
  // array adding new objects to it (Bouncers in this case)
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color(random(255)));
  }
  //CHANGED!!!!!
  // Adding a for-loop to go through the array 
  //loading sound files into it 
  for (int i = 0; i < tones.length; i++) {
    //Use the i variable to work out which filename to use
    //So far there's only one sound file, adding more if need be
    tones[i] = new SoundFile (this, "tone0" +  (i+1) + ".mp3");
  }
}

  void draw() {
    background (255);

    // Our old friend the for-loop running through the length of an array to
    // update and display objects, in this case Bouncers.
    // If the brightness (or other video property) is going to interact with all the
    // Bouncers, it will need to happen in here.
    for (int i = 0; i < bouncers.length; i++) {
      bouncers[i].update();
      bouncers[i].display();
    }
  }