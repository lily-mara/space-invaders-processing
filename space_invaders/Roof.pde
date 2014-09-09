public class Roof {

	private int posX;
	private int posY;
	private Rectangle[] rectangles;

	public roof(int x, int y) {
		this.posX = x;
		this.posY = y;
		rectangles = new rect[171];
	}

	//Draws the Roof
	public void render() {

	}

	//Send the position of the hit block for deletion?
	public void hit(rect rectangle) {

	}

	public int getX() {
		return this.posX;
	}

	public int getY() {
		return this.posY;	
	}

	public rect[] getRectangles() {
		return this.rectangles[];
	}
}