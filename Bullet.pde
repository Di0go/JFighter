class Bullet {
    //vars
    PImage bullet;
    float posX, posY, speed, damage;
    boolean stop;

    //constructor
    Bullet(String b, float s, float d) {
        bullet = loadImage(b);
        speed = s;
        damage = d;
    }

    void shootBullet() {
        calcPosition();
        moveBullet();
        drawBullet();
        //deleteBullet(); this method is being executed at draw
    }
    //this draws the bullet to the canvas
    void drawBullet() {
        image(bullet, posX, posY, width/20, height/20);
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

    /* THIS METHOD IS DISABLED, DOESN'T REALLY WORK RIGHT NOW BECAUSE OF ConcurrentModificationException
    I am not sure why yet but i think it's because i cant remove an element while iterating the list??
    this method deletes the bullets (for performance sake, its super laggy out there)
    more on how this "works" cough, cough, here https://www.youtube.com/watch?v=IsdZKG9wyBc&list=PLRqwX-V7Uu6Z9hI4mSgx2FlE5w8zvjmEy&index=3
    void deleteBullet() {
        for (Bullet bullet : bullets) {
            if (enemy.isDead()) bullets.remove(bullet); 
        }
    UPDATE: ended up deleting the bullet when the collision is being checked still keeping this here in case
    i found a way to make it work since it's way more efficient than the other way
    }*/
}