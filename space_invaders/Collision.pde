public class Collision {
	private Collidable collidable1;
	private Collidable collidable2;
	private double tolerance;

	public Collision(Collidable collidable1, Collidable collidable2, double tolerance) {
		assert tolerance > 0 && tolerance <= 1;
		this.collidable1 = collidable1;
		this.collidable2 = collidable2;
		this.tolerance = tolerance;
	}

	public Collision(Collidable collidable1, Collidable collidable2) {
		this(collidable1, collidable2, 1);
	}


	public void update() {
		if (this.collide()) {
			this.collidable1.kill();
			this.collidable2.kill();
		}
	}

	private boolean collide() {
		if ((this.collidable1.isAlive() && this.collidable2.isAlive())) {
			int xDistance = this.collidable1.getX() - this.collidable2.getX();
			int yDistance = this.collidable1.getY() - this.collidable2.getY();

			xDistance *= this.tolerance;
			yDistance *= this.tolerance;

			boolean xCollision = false;
			boolean yCollision = false;

			// if xDistance < 0 then collidable1 is to the left of collidable2
			if (xDistance < 0) {
				xCollision = -xDistance <= this.collidable1.getWidth();
			} else {
				xCollision = xDistance <= this.collidable2.getWidth();
			}

			// if yDistance < 0 then collidable1 is below collidable2
			if (yDistance < 0) {
				yCollision = -yDistance <= this.collidable2.getHeight();
			} else {
				yCollision = yDistance <= this.collidable1.getHeight();
			}

			return xCollision && yCollision;
		}
		return false;
	}
}
