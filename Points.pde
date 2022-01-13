class Points {
    //vars
    PFont font;
    float posX, posY;

    Points(String f, float x, float y, int s) {
        posX = x;
        posY = y;

        //font and it's size
        font = createFont(f, s);
    }

    void displayScore() {
        textFont(font);
        text("SCORE: " + score, posX, posY);
    }
}