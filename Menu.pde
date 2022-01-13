class Menu {
    //vars
    Button play, quit;
    PImage bg;

    //constructor
    Menu(String z) {
        //play button
        play = new Button("/data/ThaleahFat.ttf", width/2, 200, "PLAY", 100);
        //quit button
        quit = new Button("/data/ThaleahFat.ttf", width/2, 825, "QUIT", 100);
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