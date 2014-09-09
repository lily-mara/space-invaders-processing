public class Rectangle {
	private int posX;
	private int posY;
	private int width;
	private int height;
	private boolean alive;

	public rectanlge(int x, int y, int width, int height){
		this.posX = x;
		this.posY = y;
		this.width = width;
		this.height = height;
		this.isAlive(true);
	}

	public void render() {
		if(this.isAlive()) {
			rect(this.x, this.y, this.width, this.height);
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

	public boolean isAlive(boolean bool) {
		this.alive= bool;
	}
}