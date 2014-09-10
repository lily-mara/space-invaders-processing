public class Roof {
	private static final int NUM_PIXELS = 168;
	private static final int pixelSize = 4;

	private int posX;
	private int posY;
	private Rectangle[] rectangles;

	public Roof(int x, int y) {
		this.posX = x;
		this.posY = y;
		this.rectangles = new Rectangle[NUM_PIXELS];
		this.setRectangles();
	}

	public void setRectangles() {
		rectMode(CORNERS);
		int index = 0;

		//First Row
		for(int i = 0; i < 10; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize + (3 * pixelSize)), posY, pixelSize, pixelSize);
			index++;
		}

		//Second Row
		for(int i = 0; i < (3 * pixelSize); i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize + (2 * pixelSize)), posY + pixelSize, pixelSize, pixelSize);
			index++;
		}

		//Third Row
		for(int i = 0; i < (3 * pixelSize); i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize + pixelSize), posY + (2 * pixelSize), pixelSize, pixelSize);
			index++;
		}

		// big ol middle chunk
		for(int i = 0; i < 6; i++) {
			for(int k = 0; k < 16; k++){
				this.rectangles[index] = new Rectangle(posX + (i * pixelSize), posY + (i * pixelSize + (3 * pixelSize)), pixelSize, pixelSize);
				index++;
			}
		}

		//Bottom Bitch part that's stuuuuupid
		//Left bottom bitch
		for(int i = 0; i < 6; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize), posY + (9 * pixelSize), pixelSize, pixelSize);
			index++;
		}
		for(int i = 0; i < 5; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize), posY + (10 * pixelSize), pixelSize, pixelSize);
			index++;
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize), posY + (11 * pixelSize), pixelSize, pixelSize);
			index++;
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize), posY + (12 * pixelSize), pixelSize, pixelSize);
			index++;
		}

		//Right bottom bitch
		for(int i = 0; i < 6; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize + (10 * pixelSize)), posY + (9 * pixelSize), pixelSize, pixelSize);
			index++;
		}
		for(int i = 0; i < 5; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize + (11 * pixelSize)), posY + (10 * pixelSize), pixelSize, pixelSize);
			index++;
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize + (12 * pixelSize)), posY + (11 * pixelSize), pixelSize, pixelSize);
			index++;
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * pixelSize + (12 * pixelSize)), posY + (12 * pixelSize), pixelSize, pixelSize);
			index++;
		}
		println(index);
	}

	public void render() {
		for(int i = 0; i < NUM_PIXELS; i++){
			this.rectangles[i].render();
		}
	}

	public int getX() {
		return this.posX;
	}

	public int getY() {
		return this.posY;	
	}

	public Rectangle[] getRectangles() {
		return this.rectangles;
	}
}
