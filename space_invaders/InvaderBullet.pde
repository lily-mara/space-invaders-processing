import java.util.ArrayList;

public class InvaderBullet implements Collidable {
	public final int WIDTH = 2;
	public final int HEIGHT = 20;

	public final int SPEED = 10;
	public final double ODDS = 0.0005;

	private Invader parent;
	private int x;
	private int y;
	private boolean alive;
	private ArrayList<Player> players;
	private ArrayList<Rectangle> rectangles;

	public InvaderBullet(Invader parent) {
		this.parent = parent;
		this.x = parent.getX();
		this.y = parent.getY();

		this.alive = false;
		this.players = new ArrayList<Player>();
		this.rectangles = new ArrayList<Rectangle>();
	}

	public void update() {
		if (this.alive) {
			this.y += this.SPEED;
			this.checkCollide();
			fill(255);
			rect(this.x, this.y, WIDTH, HEIGHT);
		} else {
			if (Math.random() < this.ODDS) {
				this.spawn();
			}
		}
		if (this.y > height + 20) {
			this.alive = false;
		}
	}

	private void spawn() {
		this.x = this.parent.getX();
		this.y = this.parent.getY();
		this.alive = true;
	}

	public void addRectangle(Rectangle toAdd) {
		this.rectangles.add(toAdd);
	}

	public void addPlayer(Player toAdd) {
		this.players.add(toAdd);
	}

	/**
	   Return the X cordinate of the center of this invaderBullet

	   @return X cordinate of this invaderBullet
	 */
	public int getX() {
		return this.x;
	}

	/**
	   Return the Y cordinate of the center of this invaderBullet

	   @return Y cordinate of this invaderBullet
	 */
	public int getY() {
		return this.y;
	}

	/**
	   returns the width of this InvaderBullet

	   @return width of this InvaderBullet
	 */
	public int getWidth(){
		return WIDTH;
	}

	/**
	   returns the height of this InvaderBullet

	   @return height of this InvaderBullet
	 */
	public int getHeight() {
		return HEIGHT;
	}

	public void checkCollide() {
		for (int i = 0; i < this.players.size(); i++) {
			Player current = this.players.get(i);
			if (this.collidesWithPlayer(current)) {
				current.kill();
				this.alive = false;
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

	private boolean collidesWithRect(Rectangle check) {
		int toleranceX = 8;
		int toleranceY = 15;

		boolean inLeft = this.x >= check.getX() - toleranceX;
		boolean inRight = this.x <= check.getX() + check.getWidth() + toleranceX;
		boolean inTop = this.y >= check.getY() - toleranceY;
		boolean inBottom = this.y <= check.getY() + check.getHeight() + toleranceY;

		return inLeft && inRight && inTop && inBottom;
	}

	private boolean collidesWithPlayer(Player check) {
		int tolerance = 3;

		boolean inLeft = this.x >= (check.getX() - 26 - tolerance);
		boolean inRight = this.x <= (check.getX() + 26 + tolerance);
		boolean inTop = this.y >= (check.getY() - tolerance);
		boolean inBottom = this.y <= (check.getY() + 16 + tolerance);

		return inLeft && inRight && inTop && inBottom;
	}

	public boolean isAlive() {
		return this.alive;
	}
}
