/*
What I did here was defaulting the enemy's X position and re-randomizing it's Y position once it gets killed or leaves the canvas,
this allows me to "re-use" the enemy. I chose this approach because I think it's simple and good performance wise
*/
class Enemy {
    //vars
    PImage enemy;
    float posX, posY, speed, health;

    //constructor
    Enemy(String x, float s, float y) {
        enemy = loadImage(x);
        posX = y; //spawn outside the canvas so it animates the entrance
        posY = random(0, height - height/14 - 2); //height/12 because of the size of the sprite
        speed = s; //i decided to pass the speed in the constructor so i can increase the difficulty over time
        health = 100.0;
    }

    void spawnEnemy() {
        spawn();
        move();
    }

    void spawn() {
        image(enemy, posX, posY, width/14, height/14);
    }

    void move() {
        //this validates the enemy's health and its X position 
        if (posX >= -(width/14 + 4) && health > 0) {
            posX -= speed;
        }
        else {
            //this code block is responsible for the repetition of the object
            posX = random(1700, 2000);
            posY = random(0, height - height/14 - 4);
            health = 100.0; 
        }
    }

    //checks if enemy is alive or dead
    boolean isDead() {
        if (health <= 0) return true;
        else return false;
    }
}