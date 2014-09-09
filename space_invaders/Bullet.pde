import java.util.ArrayList;

public class Bullet {
	public final int SPEED = 4;

	private boolean alive;
	private Player parent;
	private int x;
	private int y;
	private ArrayList<Invader> invaders;

	public Bullet(Player parent) {
		this.x = 0;
		this.y = 0;

		this.parent = parent;
		this.alive = false;
		this.invaders = new ArrayList<Invader>();
	}

	public void spawn() {
		if (!this.alive) {
			this.x = this.parent.getX();
			this.y = this.parent.getY();
			this.alive = true;
		}
	}

	public void addInvader(Invader toAdd) {
		this.invaders.add(toAdd);
	}

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

	private boolean collidesWith(Invader check) {
		int tolerance = 3;

		boolean inLeft = this.x >= (check.getX() - 16 - tolerance);
		boolean inRight = this.x <= (check.getX() + 16 + tolerance);
		boolean inTop = this.y <= (check.getY() - 23 + tolerance);
		boolean inBottom = this.y >= (check.getY() + 23 + tolerance);

		return inLeft && inRight && inTop && inBottom;
	}

	public boolean isAlive() {
		return this.alive;
	}
}
