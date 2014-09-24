public class Collision {
	private Collidable collidable1;
	private Collidable collidable2;

	public Collision(Collidable collidable1, Collidable collidable2) {
		this.collidable1 = collidable1;
		this.collidable2 = collidable2;
	}

	public void update() {
		if (this.collide()) {
			this.collidable1.kill();
			this.collidable2.kill();
		}
	}

	private boolean collide() {
		if (!(this.collidable1.isAlive() && this.collidable2.isAlive())) {
			return false;
		}
		return false;
	}
}
