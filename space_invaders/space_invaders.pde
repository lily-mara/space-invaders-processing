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
int sDeltaY = 75;

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

int lastUpdate = 0;

void setup() {
	size(651, 744);

	pixelFont = loadFont("Courier.vlw");
	roof = loadImage("roof.png");

	FormatText();
	noStroke();
	invaders = new InvaderBlock(11, 5, sStartX, sStartY);
}

void draw() {
	background(0);
	CreatePlayer(mouseX, height - 100);
	ShotChecker();
	RenderGUI();
	DrawRoofs();
	invaders.render();
	invaders.update();
}

void TextLine(String inputText, int inputLine) {
	/*
	Prints "inputText" at the "inputLine" line. (line is an arbitrary
	 Y coordinate based on the "textStartY" and "textLineSpacing" variables)
	 */
	int textLine = textStartY + (inputLine - 1) * textLineSpacing;
	text(inputText, width/2, textLine);
}

void FormatText() {
	/*
	Adds formatting to text
	 */
	textAlign(CENTER);
	textSize(30);
}

void DrawPlayer(int posX, int posY) {
	/*
	Draws the player "space ship" at the coordinates given by the 
	 parameters. posX refers to the X coordinate of the center of the
	 player, and posY refers to the Y coordinate of the top of the player.
	 */
	fill(#00FC00);

	rectMode(CENTER);
	rect(posX, posY + 20, 52, 16);
	rect(posX, posY + 10, 44, 04);
	rect(posX, posY + 06, 12, 8);
	rect(posX, posY + 00, 4, 4);
}

void CreatePlayer(int posX, int posY) {
	/*
	Compares the "posX" and "posY" parameters to various boundaries
	 and draws the player depending on those conditionals.
	 */
	int leftBarrier = 30;
	int rightBarrier = width - 30;
	playerPosY = posY;

	if (posX > leftBarrier && posX < rightBarrier) {
		playerPosX = posX;

		DrawPlayer(posX, posY);
	} else if (posX < leftBarrier) {
		playerPosX = leftBarrier;

		DrawPlayer(leftBarrier, posY);
	} else if (posX > rightBarrier) {
		playerPosX = rightBarrier;

		DrawPlayer(rightBarrier, posY);
	}
}

void Shoot(int posX) {
	/*
	creates laser shot at the "posX" parameter
	 */
	fill(255);
	rect(posX, shotY, 5, 20);
}

void mousePressed() {
	/*
	If a laser shot doesn't exist, creates one
	 */
	if (!shotExists) {
		shotX = playerPosX;
		shotY = playerPosY - 10;
		shotExists = true;
	}
}

void ShotChecker() {
	/*
	Runs in background, controls various aspects of the laser shot.
	 */
	boolean collidesWithRoof1 = 45<shotX && shotX<145;
	boolean collidesWithRoof2 = 195<shotX && shotX<295;
	boolean collidesWithRoof3 = 345<shotX && shotX<445;
	boolean collidesWithRoof4 = 495<shotX && shotX<595;

	boolean collidesWithRoofs = collidesWithRoof1 || 
		collidesWithRoof2 || collidesWithRoof3 || collidesWithRoof4;


	if (shotExists) {
		Shoot(shotX);
		shotY -= shotSpeed;
	}
	if (shotY < 0 || (collidesWithRoofs) && shotY < 550) {
		shotExists = false;
	}
}

void RenderGUI() {
	/*
	Creates the SCORE in the top left of the screen (even though it
	 can't be changed...)
	 */
	fill(255);
	textFont(pixelFont, 20);
	text("SCORE: " + score, 50, 20);
}

void DrawRoof(int posX, int posY) {
	/*
	Draws the "roofs" (not really sure what to call them) at the "posX"
	 and "posY" coordinates
	 */
	image(roof, posX, posY, 88, 64);
}

void DrawRoofs() {
	/*
	Draws all 4 of the roofs
	 */
	DrawRoof(50, 525);
	DrawRoof(200, 525);
	DrawRoof(350, 525);
	DrawRoof(500, 525);
}
