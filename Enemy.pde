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
        speed = s;
        health = 100.0;
    }

    void spawnEnemy() {
        spawn();
        difficulty();
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
            posX = random(1700, 2300);
            posY = random(0, height - height/14 - 4);
            health = 100.0; 
        }
    }

    //checks if enemy is alive or dead
    boolean isDead() {
        if (health <= 0) return true;
        else return false;
    }

    //increases the difficulty
    void difficulty() {
        if (score >= 20) speed = 8;
        else if (score >= 40) speed = 10;
        else if (score >= 60) speed = 12;
        else if (score >= 80) speed = 14;
        else if (score >= 100) speed = 16;
        else if (score >= 120) speed = 18;
        else if (score >= 140) speed = 20;
        else if (score >= 160) speed = 22;
        else if (score >= 180) speed = 24;
        else if (score >= 200) speed = 26;
    }
}