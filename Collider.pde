class Collider {
    //vars
    float enemyPosX, enemyPosY, bulletPosX, bulletPosY, playerPosX, playerPosY, distanceB, distanceE, minBulletDistance, minEnemyDistance;

    //constructor
    Collider(float m, float e) {
        minBulletDistance = m;
        minEnemyDistance = e;
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

            //player position
            playerPosX = player.posX;
            playerPosY = player.posY;

            //bullet position
            for (int k = 0; k < bullets.size(); k++) {
                bulletPosX = bullets.get(k).posX;
                bulletPosY = bullets.get(k).posY;

                //this calculates the distance
                distanceB = dist(bulletPosX, bulletPosY, enemyPosX, enemyPosY);
                //45 was the best number I could found, still it's not perfect
                if (distanceB < minBulletDistance) {
                    //kills the enemy and adds a score point
                    enemies[i].health -= 100;
                    score += 1;
                    //if hit removes the bullet from the canvas
                    bullets.remove(k);
                }
            }
            //checks players and enemies positions
            distanceE = dist(playerPosX, playerPosY, enemyPosX, enemyPosY);
            //if enemy collides with player it removes 25 life points
            if (distanceE < minEnemyDistance) {
                enemies[i].health = 0.0;
                player.health -= 25.0;
                //goes to gameover screen
                if (player.isDead()) stage = 3;
            }
        }
    }
}