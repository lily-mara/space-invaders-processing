/*
Nate Mara
 2013-10-12
 
 "Space Invaders"
 
 This program A *very* barebones version of the game "Space Invaders" . 
 I currently have not implimented any actual game mechanics, like score 
 or shot collisions with enemies, but it's a WIP.
 
 */

// Triggers a user can change
int textStartY = 720/2;
final int textLineSpacing = 30;
final int shotSpeed = 9;
int sStartY = 100;
int sStartX = 75;

// Variables that the program uses
boolean shotExists = false;
int shotX;
int score = 0;
int playerPosX;
int playerPosY;
int shotY;

// Loads outside resources (image and font)
PFont pixelFont;
PImage roof;

// Array that stores Invaders
InvaderBlock invaders;
Player player;
Roof[] roofs;

boolean gameOver = false;

void setup() {
	size(651, 744);
	textSize(30);

	pixelFont = loadFont("Courier.vlw");
	roof = loadImage("roof.png");

	FormatText();
	noStroke();
	invaders = new InvaderBlock(11, 5, sStartX, sStartY);
	player = new Player();

	player.addInvaders(invaders.getInvaders());

	roofs = new Roof[4];
	for (int i = 0; i < roofs.length; i++) {
		roofs[i] = new Roof(50 + i*150, 525);
	}
}

void draw() {
	if (!gameOver) {
		background(0);
		renderGUI();
		invaders.render();
		invaders.update();
		player.update();

		for (Roof r : roofs) {
			r.render();
		}

		if (invaders.belowHeight(500)) {
		  gameOver = true;
		}
	} else {
		fill(#FF6600);
		text("GAME OVER", width/2, height/2);
	}
}

/**
   Every time the mouse is pressed, shoot a laser beam
 */
void mousePressed() {
	player.shoot();
}

/**
   Draw the score in top-left corner of screen
 */
void renderGUI() {
	fill(255);
	textFont(pixelFont, 20);
	text("SCORE: " + player.getScore(), 50, 20);
}
