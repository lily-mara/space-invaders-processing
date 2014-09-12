public class Rectangle {
	private int posX;
	private int posY;
	private int width;
	private int height;
	private boolean alive;

	/**
	   Construct new Rectangle object with given cordinates and size

	   @param x X cordinate of upper-left corner of this Rectangle
	   @param y Y cordinate of upper-left corner of this Rectangle
	   @param width width of this Rectangle
	   @param height height of this Rectangle
	 */
	public Rectangle (int x, int y, int width, int height){
		this.posX = x;
		this.posY = y;
		this.width = width;
		this.height = height;
		this.alive = true;
	}

	/**
	   If this Rectangle is alive, draw it
	 */
	public void render() {
		if(this.alive) {
			rect(this.posX, this.posY, this.width, this.height);
		}
	}

	/**
	   Returns the X cordinate of the upper-left corner of this Rectangle

	   @return X cordinate of this Rectangle
	 */
	public int getX() {
		return this.posX;
	}

	/**
	   Returns the X cordinate of the upper-left corner of this Rectangle

	   @return X cordinate of this Rectangle
	 */
	public int getY() {
		return this.posY;
	}

	/**
	   Returns the width of this Rectangle

	   @return width of this Rectangle
	 */
	public int getWidth() {
		return this.width;
	}

	/**
	   Returns the height of this Rectangle

	   @return height of this Rectangle
	 */
	public int getHeight() {
		return this.height;
	}

	/**
	   Set the alive status of this Rectangle to false
	 */
	public void kill() {
		this.alive = false;
	}

	/**
	   Returns the alive status of this Rectangle

	   @return alive status of this Rectangle
	 */
	public boolean isAlive() {
		return this.alive;
	}
}
