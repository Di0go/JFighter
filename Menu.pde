class Menu {
    //vars
    Button play, quit;
    PImage bg;

    //constructor
    Menu(String z) {
        //play button
        play = new Button(700, 200, "PLAY");
        //quit button
        quit = new Button(700, 825, "QUIT");
        //loads background image
        bg = loadImage(z);
    }

    void drawBackground() {
        //load background image
        background(bg);
    }

    void drawButtons() {
        play.drawText();
        play.mouseInteraction();
        quit.drawText();
        quit.mouseInteraction();
    }
}