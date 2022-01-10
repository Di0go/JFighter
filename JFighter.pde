import java.awt.*; //graphics lib
int stage = 0; //variable to control the state of the game (menu, gameplay, pause or exiting)
Menu menu; 
Player player;
Background background;

void setup() {
    size(1600,870);

    menu = new Menu("/data/hills.png"); //main menu's class
    player = new Player(50, 435, "/data/player.png"); //players class
}

void draw() {
    if (stage == 0) {
        menu.drawBackground();
        menu.drawButtons();
    }
    else if (stage == 1) {
        menu.drawBackground();
        player.move();
        player.drawPlayer();
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
}
