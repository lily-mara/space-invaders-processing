public class Player implements Collidable {
	public final int SPEED = 3;

	public final int WIDTH = 52;
	public final int HEIGHT = 32;

	private int x;
	private int y;
	private int score;
	private int lives;
	private Bullet child;

	/**
	   Construct a new Player object
	 */
	public Player() {
		this.x = width / 2;
		this.y = height - 100;
		this.score = 0;
		this.lives = 5;
		this.child = new Bullet(this);
	}


	/**
	   Draw the player "space ship" at the coordinates given

	   @param posX X coordinate of the center of the player
	   @param posY Y coordinate of the top of the player.
	 */
	private void render(int posX, int posY) {
		fill(#00FC00);

		rectMode(CENTER);
		rect(posX, posY + 20, 52, 16);
		rect(posX, posY + 10, 44, 04);
		rect(posX, posY + 06, 12, 8);
		rect(posX, posY + 00, 4, 4);
	}

	/**
	   Return the X cordinate of the center of this Player

	   @return X cordinate of this Player
	 */
	public int getX() {
		return this.x;
	}

	/**
	   Return the Y cordinate of the center of this Player

	   @return Y cordinate of this Player
	 */
	public int getY() {
		return this.y;
	}

	/**
	   returns the width of this Player

	   @return width of this Player
	 */
	public int getWidth(){
		return WIDTH;
	}

	/**
	   returns the height of this Player

	   @return height of this Player
	 */
	public int getHeight() {
		return HEIGHT;
	}

	/**
	   Shoot a bullet from the current position (there must not be a
	   Bullet on the screen)
	 */
	public void shoot() {
		this.child.spawn();
	}

	/**
	   Update the logic for this Player.

	   Update the logic for the Bullet object, render this Player, &
	   draw the life meter
	 */
	public void update() {
		this.child.update();

		if (keyPressed) {
			if (key == CODED) {
				if (keyCode == LEFT) {
					this.x -= SPEED;
				}

				if (keyCode == RIGHT) {
					this.x += SPEED;
				}
			}

			if (key == ' ') {
				this.shoot();
			}
		}

		int leftBarrier = 30;
		int rightBarrier = width - 30;

		if (this.x < leftBarrier) {
			this.x = leftBarrier;
		} else if (this.x > rightBarrier) {
			this.x = rightBarrier;
		}

		this.render(this.x, this.y);

		for (int i = 0; i < this.lives; i++) {
			this.render(50+i*70, height-40);
		}
	}

	/**
	   Add each of the Invaders in the given array to the collision
	   settings for the Bullet object belonging to this
	 */
	public void addInvaders(Invader[] invaders) {
		for (Invader i : invaders) {
			this.child.addInvader(i);
		}
	}

	/**
	   Add each of the Rectangles in the given array to the collision
	   settings for the Bullet object belonging to this
	 */
	public void addRectangles(Rectangle[] rectangles) {
		for (Rectangle i : rectangles) {
			this.child.addRectangle(i);
		}
	}

	/**
	   Returns the Player's score

	   @return Player score
	 */
	public int getScore() {
		return this.score;
	}

	/**
	   Returns number of lives remaining

	   @return number of lives this Player has
	 */
	public int getLives() {
		return this.lives;
	}

	/**
	   Decrement the number of lives this Player has by one
	 */
	public void kill() {
		this.lives--;
	}

	/**
	   Add the given score to the score of this Player

	   @param score the score to add to the score of this Player
	 */
	public void addToScore(int score) {
		this.score += score;
	}

	/**
	   returns the alive status of this Player

	   @return wether or not this Player is alive
	 */
	public boolean isAlive() {
		return this.lives > 0;
	}
}
