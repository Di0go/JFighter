class Background {
    //vars
    PImage bg, mg;
    float posX, posY, scrollOffset;

    //constructor
    Background(String b, float x) {
        scrollOffset = 1.1;
        bg = loadImage(b);

        //default x for the hills
        posX = x;
    }

    void drawScene() {
        //draws the background image
        image(bg, posX, 0);
        //debug 
        println("posX: " + posX + " posY: " + posY + "\n");
        scrollHills();
    }

    void scrollHills() {
        //while the player moves forward
        if (player.xSpeed > 0) {
            //this creates the illusion of movement by moving the middleground faster than the player
            posX -= player.xSpeed * scrollOffset;

            if (posX <= -3200) posX = 0;
        }
    }
}