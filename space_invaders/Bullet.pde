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

	}

	public void checkCollide() {

	}

	public boolean isAlive() {
		return this.alive;
	}
}
