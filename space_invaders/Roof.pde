public class Roof {

	private int posX;
	private int posY;
	private Rectangle[] rectangles;
	private static final numPixels = 171;
	private static final pixelSize = 4;

	public roof(int x, int y,) {
		this.posX = x;
		this.posY = y;
		this.rectangles = new Rectangle[numPixels];
		this.setRectangles();
	}

	public void setRectangles() {
		rectMode(CORNERS);

		//First Row
		for(int i = 0; i < 10; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize + (3 * pixelSize)), y, pixelSize, pixelSize);
		}

		//Second Row
		for(int i = 0; i < (3 * pixelSize); i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize + (2 * pixelSize)), y + pixelSize, pixelSize, pixelSize);
		}

		//Third Row
		for(int i = 0; i < (3 * pixelSize); i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize + pixelSize), y + (2 * pixelSize), pixelSize, pixelSize);
		}

		// big ol middle chunk
		for(int i = 0; i < 6) {
			for(int k = 0; k < 16; i++){
				Rectanlge[i] = new Rectangle(x + (i * pixelSize), y + (i * pixelSize + (3 * pixelSize)), pixelSize, pixelSize);
			}
		}

		//Bottom Bitch part that's stuuuuupid
		//Left bottom bitch
		for(int i = 0; i < 6; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize), y + (9 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 5; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize), y + (10 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 4; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize), y + (11 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 4; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize), y + (12 * pixelSize), pixelSize, pixelSize);
		}

		//Right bottom bitch
		for(int i = 0; i < 6; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize + (10 * pixelSize)), y + (9 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 5; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize + (11 * pixelSize)), y + (10 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 4; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize + (12 * pixelSize)), y + (11 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 4; i++) {
			Rectanlge[i] = new Rectangle(x + (i * pixelSize + (12 * pixelSize)), y + (12 * pixelSize), pixelSize, pixelSize);
		}
	}

	public void render() {
		for(int i = 0; i < 171; i++){
			Recangnle[i].render();
		}
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