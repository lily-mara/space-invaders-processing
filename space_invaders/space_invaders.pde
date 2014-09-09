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

boolean gameOver = false;

void setup() {
	size(651, 744);

	pixelFont = loadFont("Courier.vlw");
	roof = loadImage("roof.png");

	FormatText();
	noStroke();
	invaders = new InvaderBlock(11, 5, sStartX, sStartY);
	player = new Player();
}

void draw() {
	if (!gameOver) {
		background(0);
		ShotChecker();
		RenderGUI();
		DrawRoofs();
		invaders.render();
		invaders.update();
		player.render(mouseX, mouseY);

		if (invaders.belowHeight(500)) {
		  gameOver = true;
		}
	} else {
		fill(#FF6600);
		TextLine("GAME OVER", 5);
	}
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
	player.shoot();
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
