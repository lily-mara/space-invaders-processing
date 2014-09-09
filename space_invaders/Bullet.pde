public class Bullet {
	public final int SPEED = 4;

	private boolean alive;
	private Player parent;
	private int x;
	private int y;

	public Bullet(Player parent) {
		this.x = 0;
		this.y = 0;

		this.parent = parent;
		this.alive = false;
	}

	public void spawn() {

	}

	public void addInvader(Invader toAdd) {

	}

	public void checkCollide() {

	}

	public boolean isAlive() {
		return this.alive;
	}
}
