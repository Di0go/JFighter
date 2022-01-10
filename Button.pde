class Button {
    //vars
    float posX, posY;
    int tSize;
    String text;
    color tColor;

    //constructor
    Button(float x, float y, String t) {
        posX = x;
        posY = y;
        text = t;
        //text color and text size
        tColor = color(255);
        tSize = 100;
    }

    //method to draw the text
    void drawText() {
        textSize(tSize);

        //changes the color of the text on mouse hover using the text's X and Y positions
        if (mouseX > posX && mouseX < posX + 210 && mouseY < posY && mouseY > posY - 80) 
            fill(136,155,192);
        else fill
            (tColor);

        text(text, posX, posY);
    }

    void mouseInteraction() {
        //changes the value of the stage variable if the button is pressed, thus playing the game
        if (mouseX > menu.play.posX && mouseX < menu.play.posX + 210 && mouseY < menu.play.posY && mouseY > menu.play.posY - 80 && mousePressed == true) {
            stage = 1;
        }        
        //changes the value of the stage variable if the button is pressed, thus quitting the game
        if (mouseX > menu.quit.posX && mouseX < menu.quit.posX + 210 && mouseY < menu.quit.posY && mouseY > menu.quit.posY - 80 && mousePressed == true) {
            stage = 2;
        }
        
    }
}