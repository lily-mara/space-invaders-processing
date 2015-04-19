import java.util.ArrayList;

public class Collisions {
	private ArrayList<Collision> collisions;

	public Collisions() {
		this.collisions = new ArrayList<Collision>();
	}

	public void addCollision(Collidable c1, Collidable c2, double tolerance) {
		this.addCollision(new Collision(c1, c2, tolerance));
	}

	public void addCollision(Collidable c1, Collidable c2) {
		this.addCollision(new Collision(c1, c2));
	}

	public void addCollision(Collision c) {
		this.collisions.add(c);
	}

	public void update() {
		for (Collision c : this.collisions) {
			c.update();
		}
	}
}
