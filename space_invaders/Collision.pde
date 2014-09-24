public class Collision {
	private Collidable collidable1;
	private Collidable collidable2;

	public Collision(Collidable collidable1, Collidable collidable2) {
		this.collidable1 = collidable1;
		this.collidable2 = collidable2;
	}

	public void update() {

	}

	public boolean collide() {
		return false;
	}
}
