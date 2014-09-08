/* @pjs preload="roof.png"; */

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

boolean gameOver = false;

void setup() {
	size(651, 744);

	pixelFont = loadFont("Courier.vlw");
	roof = loadImage("roof.png");

	FormatText();
	noStroke();
	invaders = new InvaderBlock(11, 5, sStartX, sStartY);
}

void draw() {
	if (!gameOver) {
		background(0);
		CreatePlayer(mouseX, height - 100);
		ShotChecker();
		RenderGUI();
		DrawRoofs();
		invaders.render();
		invaders.update();

		if (invaders.belowHeight(500)) {
		  gameOver = true;
		}
	} else {
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
public class Invader {
	private final int MOVE_FACTOR = 3;
	private final int LEVEL = 10;

	private int posX;
	private int posY;
	private boolean alive = true;
	private boolean moveRight = true;

	/**
	   A single "space invader" object
	   @param posX the the left bound of this invader
	   @param posY the right bound of this invader
	 */
	public Invader(int posX, int posY) {
		this.posX = posX;
		this.posY = posY;
	}

	/**
	   Draw this space invader
	 */
	public void render() {
		rect(this.posX, this.posY + 5, 28, 8);
		rect(this.posX, this.posY, 12, 16);
		rect(this.posX - 12, this.posY + 10, 4, 4);
		rect(this.posX + 12, this.posY + 10, 4, 4);
		rect(this.posX - 6, this.posY + 14, 8, 4);
		rect(this.posX + 6, this.posY + 14, 8, 4);
		rect(this.posX - 8, this.posY - 10, 4, 4);
		rect(this.posX + 8, this.posY - 10, 4, 4);
		rect(this.posX - 12, this.posY - 14, 4, 4);
		rect(this.posX + 12, this.posY - 14, 4, 4);
		rect(this.posX - 10, this.posY - 6, 8, 4);
		rect(this.posX + 10, this.posY - 6, 8, 4);
		rect(this.posX - 12, this.posY - 1, 4, 6);
		rect(this.posX + 12, this.posY - 1, 4, 6);
		rect(this.posX - 16, this.posY - 0, 4, 8);
		rect(this.posX + 16, this.posY - 0, 4, 8);
		rect(this.posX - 20, this.posY + 6, 4, 12);
		rect(this.posX + 20, this.posY + 6, 4, 12);
	}

	/**
	   Reverse the direction of this space invader
	 */
	public void flip() {
		this.moveRight = !this.moveRight;
	}

	/**
	   Update the location of this space invader
	 */
	public void update() {
		if (this.moveRight) {
			this.posX += MOVE_FACTOR;
		} else {
			this.posX -= MOVE_FACTOR;
		}
	}

	public void downLevel() {
		this.posY += LEVEL;
	}
	
	public boolean isAlive() {
		return this.alive;
	}

	public int getX() {
		return this.posX;
	}

	public int getY() {
		return this.posY;
	}

}
public class InvaderBlock {
	private final int BORDER = 40;
	private final int X_SPACING = 50;
	private final int Y_SPACING = 60;

	private Invader[][] block;
	private int blockWidth;
	private int blockHeight;
	private int startX;
	private int startY;

	private int lastUpdate;
	private int delay;

	/**
	   An instance of InvaderBlock class is a collection of Invader objects

	   @param blockWidth the number of invaders in each row of block
	   @param blockHeight the number of invaders in each column of block
	   @param startX the initial left boundary of the block
	   @param startY the initial upper boundary of the block
	*/
	public InvaderBlock(int blockWidth, int blockHeight, int startX, int startY) {
		this.block = new Invader[blockHeight][blockWidth];
		this.startX = startX;
		this.startY = startY;
		this.blockWidth = blockWidth;
		this.blockHeight = blockHeight;

		this.lastUpdate = 0;
		this.delay = 300;

		for (int i = 0; i < blockHeight; i++) {
			for (int j = 0; j < blockWidth; j++) {
				int x = this.startX + j * X_SPACING;
				int y = this.startY + i * Y_SPACING;
				this.block[i][j] = new Invader(x, y);
			}
		}
	}

	/**
	   Draws every Invader object in this InvaderBlock
	 */
	public void render() {
		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.render();
			}
		}
	}

	/**
	   If the appropriate delay has elapsed, then update the positions
	   of the invaders in this block
	 */
	public void update() {
		if (millis() > this.lastUpdate + this.delay) {
			this.lastUpdate = millis();

			if (this.flipCheck()) {
				this.flip();
			}

			for (Invader[] i : this.block) {
				for (Invader j : i) {
					j.update();
				}
			}
		}
	}

	/**
	   Check if this block needs to be flipped (if the left/rightmost
	   invader has reached a border)

	   @return true if the block needs to be flipped, false otherwise
	 */
	public boolean flipCheck() {
		if (this.getRightmost().getX() >= width-BORDER) {
			return true;
		}

		if (this.getLeftmost().getX() <= BORDER) {
			return true;
		}

		return false;
	}

	/**
	   Returns the rightmost Invader in this block that is alive (no
	   assumptions should be made about the height of the Invader)

	   @return rightmost Invader in this block
	 */
	public Invader getRightmost() {
		for (int i = this.blockWidth-1; i >= 0; i--) {
			for (int j = 0; j < this.blockHeight; j++) {
				if (this.block[j][i].isAlive()) {
					return this.block[j][i];
				}
			}
		}
		return new Invader(0, 0);
	}

	/**
		Returns true if the lowest alive Invader is at or below the
		given height false otherwise

		@param height the height to check if the lowest Invader has reached
		@return true if height has been breached false otherwise
	 */
	public boolean belowHeight(int height) {
		return this.getLowest().getY() >= height;
	}
	
	
	/**
	   Returns the leftmost Invader in this block that is alive (no
	   assumptions should be made about the X of the Invader)

	   @return leftmost Invader in this block
	 */
	public Invader getLeftmost() {
		for (int i = 0; i < this.blockWidth; i++) {
			for (int j = 0; j < this.blockHeight; j++) {
				if (this.block[j][i].isAlive()) {
					return this.block[j][i];
				}
			}
		}
		return new Invader(0, 0);
	}

	/**
	   Returns the lowest Invader in this block that is alive (no
	   assumptions should be made about the height of the Invader)

	   @return lowest Invader in this block
	 */
	public Invader getLowest() {
		for (int i = this.blockHeight - 1; i >= 0; i--) {
			for (int j = 0; j < this.blockWidth; j++) {
				if (this.block[i][j].isAlive()) {
					return this.block[i][j];
				}
			}
		}
		return new Invader(0, 0);
	}

	/**
	   If the block is moving right, make it move left and
	   vice-versa. Also, decrease the delay by 20ms, and move the
	   block down a level.
	 */
	private void flip() {
		if (this.delay > 0) {
			this.delay -= 20;
		}

		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.flip();
				j.downLevel();
			}
		}
	}
}

