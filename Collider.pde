class Collider {
    //vars
    float enemyPosX, enemyPosY, bulletPosX, bulletPosY, distance, minDistance;

    //constructor
    Collider(float m) {
        minDistance = m;
    }

    void runColliders() {
        posSetter();
    }

    /*
    this method receives the enemy's and the bullet's positions
    i am terribly sorry for this two loop mess but to be honest i was running out of time and it was the only thing i could think of
    */
    void posSetter() {
        //enemies position
        for (int i = 0; i < enemies.length; i++) {
            enemyPosX = enemies[i].posX;
            enemyPosY = enemies[i].posY;

            //bullet position
            for (int k = 0; k < bullets.size(); k++) {
                bulletPosX = bullets.get(k).posX;
                bulletPosY = bullets.get(k).posY;

                //this calculates the distance
                distance = dist(bulletPosX, bulletPosY, enemyPosX, enemyPosY);
                //45 was the best number I could found, still it's not perfect
                if (distance < minDistance) {
                    //kills the enemy and adds a score point
                    enemies[i].health -= 100;
                    score += 1;
                    //if hit removes the bullet from the canvas
                    bullets.remove(k);
                }
            }
        }
    }
}