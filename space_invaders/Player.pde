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

		for (int i = 0; i < this.lives; i++) {
			this.render(50+i*70, height-40);
		}
	}

	public void addInvaders(Invader[] invaders) {
		for (Invader i : invaders) {
			this.child.addInvader(i);
		}
	}

	public void addRectangles(Rectangle[] rectangles) {
		for (Rectangle i : rectangles) {
			this.child.addRectangle(i);
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

	public void die() {
		this.lives--;
	}
}
