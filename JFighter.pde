import java.awt.*; //graphics lib
int stage = 0; //variable to control the state of the game (menu, gameplay, pause or exiting)
public int score = 0;
Menu menu; 
Player player;
Background background;
public Enemy[] enemies;
public ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Collider collider;
Points points;
GameOver gameover;

void setup() {
    size(1600,870);
    smooth(8);
    textAlign(CENTER);
    menu = new Menu("/data/hills.png"); //main menu's class
    player = new Player(50, 435, "/data/player.png"); //players class
    background = new Background("/data/big-hills2.png", 0); //background class
    enemies = new Enemy[12];
    for (int i = 0; i < enemies.length; i++) {
        enemies[i] = new Enemy("/data/enemy_red.png", 4, random(1700, 2300)); //enemy class
    }
    collider = new Collider(45, 85); //minDistance
    points = new Points("/data/ThaleahFat.ttf", width/2, 50, 64);
    gameover = new GameOver("/data/ThaleahFat.ttf", width/2, height/2, 128);
}

void draw() {
    if (stage == 0) {
        menu.drawBackground();
        menu.drawButtons();
    }
    else if (stage == 1) {
        background.drawScene();
        player.drawPlayer();
        //loops trought the list of bullets and updates them
        for (Bullet bullet : bullets) {
            bullet.shootBullet();
        }
        for (Enemy enemy : enemies) {
            enemy.spawnEnemy();
        }
        collider.runColliders();
        points.displayScore();
    }
    else if (stage == 2) {
        exit();
    }
    else if (stage == 3) {
        menu.drawBackground();
        gameover.displayGameOver();
    }
}

//validates the user input
void keyPressed() {
    player.pressed((key == 'w' || key == 'W'), (key == 's' || key == 'S'), (key == 'a' || key == 'A'), (key == 'd' || key == 'D'));
    //each time the user presses space a new bullet is added to the array :)
    if (key == ' ') bullets.add(new Bullet("/data/bullet.png", 25, 100));
}

void keyReleased() {
    player.released((key == 'w' || key == 'W'), (key == 's' || key == 'S'), (key == 'a' || key == 'A'), (key == 'd' || key == 'D'));
}