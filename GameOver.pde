class GameOver {
    //vars
    PFont font;
    String text;
    float posX, posY;
    Button returntomenu;

    //constructor
    GameOver(String f, float x, float y, int s) {
        posX = x;
        posY = y;

        //font and it's size
        font = createFont(f, s);
    }

    void displayGameOver() {
        textFont(font);
        fill(255, 101, 101);
        text("GAME OVER", posX, posY);
        textSize(64);
        fill(255, 101, 101);
        text("YOUR SCORE WAS " + score, posX, posY + 100);
        fill(255, 101, 101);
        returntomenu = new Button("/data/ThaleahFat.ttf", width/2, 600, "RETURN", 100);
        returntomenu.drawText();
        //interaction for the return button
        if (mouseX > gameover.returntomenu.posX - 105 && mouseX < gameover.returntomenu.posX + 105 && mouseY < gameover.returntomenu.posY && mouseY > gameover.returntomenu.posY - 80 && mousePressed == true) {
            stage = 0;
            score = 0;
            player.health = 100.0;
        }  
    }
}