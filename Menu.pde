class Menu {
    //vars
    Button play, quit;
    PImage bg;
    PFont font;

    //constructor
    Menu(String z) {
        //play button
        play = new Button("/data/ThaleahFat.ttf", width/2, 200, "PLAY", 100);
        //quit button
        quit = new Button("/data/ThaleahFat.ttf", width/2, 825, "QUIT", 100);
        //loads background image
        bg = loadImage(z);
        font = createFont("/data/ThaleahFat.ttf", 200);
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
        fill(85, 85, 255);
        textFont(font);
        text("JFIGHTER", width/2, height/2);
    }
}