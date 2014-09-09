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

	player.addInvaders(invaders.getInvaders());
}

void draw() {
	if (!gameOver) {
		background(0);
		ShotChecker();
		RenderGUI();
		DrawRoofs();
		invaders.render();
		invaders.update();
		player.update();

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
import java.util.ArrayList;

public class Bullet {
	public final int SPEED = 15;

	private boolean alive;
	private Player parent;
	private int x;
	private int y;
	private ArrayList<Invader> invaders;

	/**
	   Construct a new Bullet object with the given Player object as
	   the parent

	   @param parent the Player object to make the parent of this Bullet
	 */
	public Bullet(Player parent) {
		this.x = 0;
		this.y = 0;

		this.parent = parent;
		this.alive = false;
		this.invaders = new ArrayList<Invader>();
	}

	public void update() {
		if (this.alive) {
			this.y -= this.SPEED;
			this.checkCollide();
			fill(255);
			rect(this.x, this.y, 5, 20);
		}
		
		if (this.y < -10) {
			this.alive = false;
		}
	}

	/**
	   If this is not alive, then make it alive and set the position
	   to the positiion of the parent Player object
	 */
	public void spawn() {
		if (!this.alive) {
			this.x = this.parent.getX();
			this.y = this.parent.getY();
			this.alive = true;
		}
	}

	/**
	   Add the given Invader to the ArrayList of Invaders that this
	   stores for collision detection

	   @param toAdd the Invader to add
	 */
	public void addInvader(Invader toAdd) {
		this.invaders.add(toAdd);
	}

	/**
	   Check the current position of this and compare it to the
	   position of all of the Invaders to detect a collision.

	   If a collision is detected, kill the colliding Invader, stop
	   displaying this and increase the score
	 */
	public void checkCollide() {
		for (int i = 0; i < this.invaders.size(); i++) {
			Invader current = this.invaders.get(i);
			if (current.isAlive()) {
				if (this.collidesWith(current)) {
					current.kill();
					this.alive = false;
					this.parent.addToScore(50);
				}
			}
		}
	}

	/**
	   Returns true if this bullet collides with the given Invader,
	   false otherwise

	   @param check the Invader to check if this collides
	   @return true if this bullet collides with the given Invader
	 */
	private boolean collidesWith(Invader check) {
		int tolerance = 3;

		boolean inLeft = this.x >= (check.getX() - 16 - tolerance);
		boolean inRight = this.x <= (check.getX() + 16 + tolerance);
		boolean inTop = this.y >= (check.getY() - 23 + tolerance);
		boolean inBottom = this.y <= (check.getY() + 23 + tolerance);

		return inLeft && inRight && inTop && inBottom;
	}

	/**
	   Returns the instance variable `alive`
	   @return the instance variable `alive`
	 */
	public boolean isAlive() {
		return this.alive;
	}
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
		if (this.alive) {
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
	}

	/**
	   sets the life status to false
	 */
	public void kill() {
		this.alive = false;
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

	public Invader[] getInvaders() {
		Invader[] invaderArray = new Invader[this.blockWidth*this.blockHeight];
		int index = 0;
		for (int i = 0; i < this.blockWidth; i++) {
			for (int j = 0; j < this.blockHeight; j++) {
				invaderArray[index] = this.block[j][i];
				index++;
			}
		}

		return invaderArray;

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
public class Player {

	private int x;
	private int y;
	private int score;
	private int lives;
	private Bullet child;

	public Player() {
		this.x = x;
		this.y = y;
		this.score = 0;
		this.lives = 5;
		this.child = new Bullet(this);
	}


	private void render(int posX, int posY) {
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

	public void shoot() {
		this.child.spawn();
	}

	public void update() {
		this.child.update();

		this.x = mouseX;
		this.y = height - 100;

		int leftBarrier = 30;
		int rightBarrier = width - 30;

		if (this.x > leftBarrier && this.x < rightBarrier) {
			this.render(this.x, this.y);
		} else if (this.x < leftBarrier) {
			this.render(leftBarrier, this.y);
		} else if (this.x > rightBarrier) {
			this.render(rightBarrier, this.y);
		}
	}

	public void addInvaders(Invader[] invaders) {
		for (Invader i : invaders) {
			this.child.addInvader(i);
		}
	}

	public int getScore() {
		return this.score;
	}

	public int getLives() {
		return this.lives;
	}

	public void kill() {
		this.lives--;
	}

	public void addToScore(int score) {
		this.score += score;
	}

	public int getX() {
		return this.x;
	}

	public int getY() {
		return this.y;
	}
}

