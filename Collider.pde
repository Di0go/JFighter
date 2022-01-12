class Collider {
    //vars
    float enemyPosX, enemyPosY, bulletPosX, bulletPosY, distance, minDistance;

    //constructor
    Collider(float m) {
        minDistance = m;
    }

    void runColliders() {
        posSetter();
        calculateDistance();
    }

    //this methods receives the enemy's and the bullet's positions
    void posSetter() {
        //enemie position
        enemyPosX = enemy.posX;
        enemyPosY = enemy.posY;

        //bullet position
        bulletPosX = bullet.posX;
        bulletPosY = bullet.posY;
    }

    //this method calculates the distance between the enemy and the bullet
    void calculateDistance() {
        distance = dist(bulletPosX, bulletPosY, enemyPosX, enemyPosY);
        if (distance < 50) {
            enemy.health -= bullet.damage;
        }
    }
}