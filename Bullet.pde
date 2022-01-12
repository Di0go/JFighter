class Bullet {
    //vars
    PImage bullet;
    float posX, posY, speed, damage;
    boolean shoot, stop;

    //constructor
    Bullet(String b, float s, float d) {
        bullet = loadImage(b);
        speed = s;
        damage = d;
    }

    void shootBullet() {
        if (shoot == true) {
            calcPosition();
            drawBullet();
            moveBullet();
        }
    }
    //this draws the bullet to the canvas
    void drawBullet() {
        image(bullet, posX, posY, width/20, height/20);
    }

    //validates user input and acts as a switch
    void released(boolean space) {
        if (space) shoot = true;
    }

    //method to move the bullet
    void moveBullet() {
        posX += speed;
    }

    /*
    this method calculates the starting position of the bullet using the players positions and sizes
    the stop variable acts as a switch so the bullet's posX and posY doesn't update with the player thus allowing
    the bullet to only be affected by the moveBullet() method.
    */
    void calcPosition() {
        if (stop == false) {
            posX = player.posX + 90;
            posY = player.posY + 30;
            stop = true;
        }
    }
}