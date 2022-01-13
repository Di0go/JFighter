class Button {
    //vars
    PFont font;
    float posX, posY;
    String text;
    color tColor;

    //constructor
    Button(String f, float x, float y, String t, int s) {
        posX = x;
        posY = y;
        text = t;
        tColor = color(255);
        //font and it's size
        font = createFont(f, s);
    }

    //method to draw the text
    void drawText() {
        textFont(font);
        //changes the color of the text on mouse hover using the text's X and Y positions
        if (mouseX > posX - 105 && mouseX < posX + 105 && mouseY < posY && mouseY > posY - 80) 
            fill(136,155,192);
        else fill
            (tColor);

        //display the text
        text(text, posX, posY);
    }

    void mouseInteraction() {
        //changes the value of the stage variable if the button is pressed, thus playing the game
        if (mouseX > menu.play.posX - 105 && mouseX < menu.play.posX + 105 && mouseY < menu.play.posY && mouseY > menu.play.posY - 80 && mousePressed == true) {
            stage = 1;
        }        
        //changes the value of the stage variable if the button is pressed, thus quitting the game
        if (mouseX > menu.quit.posX - 105 && mouseX < menu.quit.posX + 105 && mouseY < menu.quit.posY && mouseY > menu.quit.posY - 80 && mousePressed == true) {
            stage = 2;
        }
        
    }
}