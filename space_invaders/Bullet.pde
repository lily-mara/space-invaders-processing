import java.util.ArrayList;

public class Bullet {
	public final int SPEED = 15;

	private boolean alive;
	private Player parent;
	private int x;
	private int y;
	private ArrayList<Invader> invaders;
	private ArrayList<Rectangle> rectangles;

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
		this.rectangles = new ArrayList<Rectangle>();
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
	   Add the given Rectangle to the ArrayList of Rectangles that this
	   stores for collision detection

	   @param toAdd the Rectangle to add
	 */
	public void addRectangle(Rectangle toAdd) {
		this.rectangles.add(toAdd);
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
				if (this.collidesWithInvader(current)) {
					current.kill();
					this.alive = false;
					this.parent.addToScore(50);
				}
			}
		}

		for (int i = 0; i < this.rectangles.size(); i++) {
			Rectangle current = this.rectangles.get(i);
			if (current.isAlive()) {
				if(this.collidesWithRect(current)) {
					current.kill();
					this.alive = false;
				}
			}
		}
	}

	/**
	   Returns true if this bullet collides with the given Rectangle,
	   false otherwise

	   @param check the Rectangle to check if this collides
	   @return true if this bullet collides with the given Rectangle
	 */
	private boolean collidesWithRect(Rectangle check) {
		int toleranceX = 8;
		int toleranceY = 15;

		boolean inLeft = this.x >= check.getX() - toleranceX;
		boolean inRight = this.x <= check.getX() + check.getWidth() + toleranceX;
		boolean inTop = this.y >= check.getY() - toleranceY;
		boolean inBottom = this.y <= check.getY() + check.getHeight() + toleranceY;

		return inLeft && inRight && inTop && inBottom;
	}

	/**
	   Returns true if this bullet collides with the given Invader,
	   false otherwise

	   @param check the Invader to check if this collides
	   @return true if this bullet collides with the given Invader
	 */
	private boolean collidesWithInvader(Invader check) {
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
