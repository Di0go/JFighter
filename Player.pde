//note: some of this code was studied and extracted from: https://stackoverflow.com/questions/60307773/smooth-movement-in-processing
class Player {
    float posX, posY, xSpeed, ySpeed, speedLimit, acceleration;
    boolean move_up = false, move_down = false, move_left = false, move_right = false;
    PImage plane;

    //constructor
    Player(float x, float y, String z) {
        //player pos and speed
        posX = x;
        posY = y;
        ySpeed = 0.0;
        xSpeed = 0.0;
        speedLimit = 6.0;
        acceleration = 0.2;
        //loads the player's sprite
        plane = loadImage(z);
    }

    //this method draws the image to the screen
    void drawPlayer() {
        image(plane, posX, posY, width/11, height/11);
    }

   //this method receives the pressed input and acts as a switch for the booleans 
    void pressed(boolean up, boolean down, boolean left, boolean right) {
        if (up) move_up   = true;
        if (down) move_down = true;
        if (left) move_left   = true;
        if (right) move_right = true;
    }

    //this method receives the released input and acts as a switch for the booleans 
    void released(boolean up, boolean down, boolean left, boolean right) {
        if (up) move_up   = false;
        if (down) move_down = false;
        if (left) move_left   = false;
        if (right) move_right = false;
    }

    void move() {
        /*this results in a smoother movement
        up and down*/
        if (!move_up && !move_down) ySpeed *= 0.95;
        if (move_up) ySpeed -= acceleration;
        if (move_down) ySpeed += acceleration;
        ySpeed = max(-(speedLimit), min(speedLimit, ySpeed));
        posY += ySpeed;

        //left and right
        if (!move_left && !move_right) xSpeed *= 0.95;
        if (move_left) xSpeed -= acceleration;
        if (move_right) xSpeed += acceleration;
        xSpeed = max(-(speedLimit), min(speedLimit, xSpeed));
        posX += xSpeed;

        //this blocks the player from exiting the canvas
        if (posY < 2) posY = 2;
        if (posY > height - height/11 - 2) posY = height - height/11 - 2;

        if (posX < 2) posX = 2;
        if (posX > width - width/11 - 2) posX = width - width/11 - 2;
    }
}