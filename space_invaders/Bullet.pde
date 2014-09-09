import java.util.ArrayList;

public class Bullet {
	public final int SPEED = 4;

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
			if (this.collidesWith(current)) {
				current.kill();
				this.alive = false;
				this.parent.addToScore(50);
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
		boolean inTop = this.y <= (check.getY() - 23 + tolerance);
		boolean inBottom = this.y >= (check.getY() + 23 + tolerance);

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
