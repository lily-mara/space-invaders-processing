public class Roof {
	private static final int NUM_PIXELS = 168;
	private static final int PIXEL_SIZE = 4;

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
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE + (3 * PIXEL_SIZE)), posY, PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}

		//Second Row
		for(int i = 0; i < 11; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE + (2 * PIXEL_SIZE)), posY + PIXEL_SIZE, PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}

		//Third Row
		for(int i = 0; i < 12; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE + PIXEL_SIZE), posY + (2 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}

		// big ol middle chunk
		for(int i = 0; i < 6; i++) {
			for(int k = 0; k < 16; k++){
				this.rectangles[index] = new Rectangle(posX + (k * PIXEL_SIZE), posY + (i * PIXEL_SIZE + (3 * PIXEL_SIZE)), PIXEL_SIZE, PIXEL_SIZE);
				index++;
			}
		}

		//Bottom Bitch part that's stuuuuupid
		//Left bottom bitch
		for(int i = 0; i < 6; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE), posY + (9 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}
		for(int i = 0; i < 5; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE), posY + (10 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE), posY + (11 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE), posY + (12 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}

		//Right bottom bitch
		for(int i = 0; i < 6; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE + (10 * PIXEL_SIZE)), posY + (9 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}
		for(int i = 0; i < 5; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE + (11 * PIXEL_SIZE)), posY + (10 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE + (12 * PIXEL_SIZE)), posY + (11 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
			index++;
		}
		for(int i = 0; i < 4; i++) {
			this.rectangles[index] = new Rectangle(posX + (i * PIXEL_SIZE + (12 * PIXEL_SIZE)), posY + (12 * PIXEL_SIZE), PIXEL_SIZE, PIXEL_SIZE);
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
