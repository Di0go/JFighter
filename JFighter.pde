import java.awt.*; //graphics lib
int stage = 0; //variable to control the state of the game (menu, gameplay, pause or exiting)
Menu menu; 
Player player;
Background background;
Enemy enemy;
Bullet bullet;

void setup() {
    size(1600,870);
    smooth(8);
    menu = new Menu("/data/hills.png"); //main menu's class
    player = new Player(50, 435, "/data/player.png"); //players class
    background = new Background("/data/big-hills2.png", 0); //background class
    enemy = new Enemy("/data/enemy_red.png", random(2, 5)); //enemy class
    bullet = new Bullet("/data/bullet.png", 15, 50);
}

void draw() {
    if (stage == 0) {
        menu.drawBackground();
        menu.drawButtons();
    }
    else if (stage == 1) {
        background.drawScene();
        player.drawPlayer();
        bullet.shootBullet();
        enemy.spawnEnemy();
    }
    else if (stage == 2) {
        exit();
    }
}

//validates the user input
void keyPressed() {
    player.pressed((key == 'w' || key == 'W'), (key == 's' || key == 'S'), (key == 'a' || key == 'A'), (key == 'd' || key == 'D'));
}

void keyReleased() {
    player.released((key == 'w' || key == 'W'), (key == 's' || key == 'S'), (key == 'a' || key == 'A'), (key == 'd' || key == 'D'));
    bullet.released((key == ' '));
}