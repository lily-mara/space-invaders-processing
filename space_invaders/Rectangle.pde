public class Rectangle {
	private int posX;
	private int posY;
	private int width;
	private int height;
	private boolean alive;

	public Rectangle (int x, int y, int width, int height){
		this.posX = x;
		this.posY = y;
		this.width = width;
		this.height = height;
		this.alive = true;
	}

	public void render() {
		if(this.alive) {
			rect(this.posX, this.posY, this.width, this.height);
		}
	}

	public int getX() {
		return this.posX;
	}

	public int getY() {
		return this.posY;
	}

	public int getWidth() {
		return this.width;
	}

	public int getHeight() {
		return this.height;
	}

	public void kill() {
		this.alive = false;
	}

	public boolean isAlive() {
		return this.alive;
	}
}
