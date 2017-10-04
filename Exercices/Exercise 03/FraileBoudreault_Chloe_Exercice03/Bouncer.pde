class Bouncer {
 
 //defines the location of the balls on the X and Y axis
 int x;
 int y;
 //defines the speed of the balls
 int vx;
 int vy;
 //defines the size of the balls
 int size;
 //defines the colours of the balls (when hovered over and default)
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 //this is the constructor
 //determines the setup for the balls
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   //defines the properties of the constructor
   //location, speed, size, colours
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 
 //this is one of the methods
 //moves the balls here
 void update() {
   //moves the balls each frame by making sure the speed is added each time
   x += vx;
   y += vy;
   
   //create other functions which will allow the ball to bounce of the walls and 
   //change colour when the mouse hovers over 
   handleBounce();
   handleMouse();
 }
 
 void handleBounce() {
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
   }
   
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}