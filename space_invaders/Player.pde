public class Player {

	private int x;
	private int y;
	private int score;
	private int lives;
	private Bullet child;

	public Player() {
		this.x = x;
		this.y = y;
		this.score = score;
		this.lives = live;
		this.child = new Bullet(this);
	}

	
	public void render(int posX, int posY) {
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
	
	public void update() {
		this.x = mouseX;
		this.y = mouseY;

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
}