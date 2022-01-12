/*
what i am trying to do here is defaulting the enemy's X position and randomizing its Y position again once it dies
so the enemys can be re-used, speed is the key since it allows us to increase the difficulty of the game.
i choose this approach because i am already feeling like the game is a bit laggy and this will reduce performance issues
*/
class Enemy {
    //vars
    PImage enemy;
    float posX, posY, speed, health;

    //constructor
    Enemy(String x, float s) {
        enemy = loadImage(x);
        posX = 1700; //spawn outside the canvas so it animates the entrance
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
        //this validates the enemy's health and it's X position 
        if (posX >= -(width/14 + 4) && health > 0) {
            posX -= speed;
        }
        else {
            //this code block is responsible for the repetition of the object 
            posX = 1700;
            posY = random(0, height - height/14 - 4);
        }
    }
}