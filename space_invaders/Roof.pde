public class Roof {
	private static final int numPixels = 171;
	private static final int pixelSize = 4;

	private int posX;
	private int posY;
	private Rectangle[] rectangles;

	public Roof(int x, int y) {
		this.posX = x;
		this.posY = y;
		this.rectangles = new Rectangle[numPixels];
		this.setRectangles();
	}

	public void setRectangles() {
		rectMode(CORNERS);

		//First Row
		for(int i = 0; i < 10; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize + (3 * pixelSize)), posY, pixelSize, pixelSize);
		}

		//Second Row
		for(int i = 0; i < (3 * pixelSize); i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize + (2 * pixelSize)), posY + pixelSize, pixelSize, pixelSize);
		}

		//Third Row
		for(int i = 0; i < (3 * pixelSize); i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize + pixelSize), posY + (2 * pixelSize), pixelSize, pixelSize);
		}

		// big ol middle chunk
		for(int i = 0; i < 6; i++) {
			for(int k = 0; k < 16; k++){
				this.rectangles[i] = new Rectangle(posX + (i * pixelSize), posY + (i * pixelSize + (3 * pixelSize)), pixelSize, pixelSize);
			}
		}

		//Bottom Bitch part that's stuuuuupid
		//Left bottom bitch
		for(int i = 0; i < 6; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize), posY + (9 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 5; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize), posY + (10 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize), posY + (11 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize), posY + (12 * pixelSize), pixelSize, pixelSize);
		}

		//Right bottom bitch
		for(int i = 0; i < 6; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize + (10 * pixelSize)), posY + (9 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 5; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize + (11 * pixelSize)), posY + (10 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize + (12 * pixelSize)), posY + (11 * pixelSize), pixelSize, pixelSize);
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[i] = new Rectangle(posX + (i * pixelSize + (12 * pixelSize)), posY + (12 * pixelSize), pixelSize, pixelSize);
		}
	}

	public void render() {
		for(int i = 0; i < 171; i++){
			this.rectangles[i].render();
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
		return this.rectangles;
	}
}
