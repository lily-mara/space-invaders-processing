public class InvaderBlock {
	private final int BORDER = 40;
	private final int DELTA_X = 50;
	private final int DELTA_Y = 75;

	private Invader[][] block;
	private int blockWidth;
	private int blockHeight;
	private int startX;
	private int startY;

	private int lastUpdate;
	private int delay;

	/**
	   An instance of InvaderBlock class is a collection of Invader objects
	   @param blockWidth the number of invaders in each row of block
	   @param blockHeight the number of invaders in each column of block
	   @param startX the initial left boundary of the block
	   @param startY the initial upper boundary of the block
	*/
	public InvaderBlock(int blockWidth, int blockHeight, int startX, int startY) {
		this.block = new Invader[blockHeight][blockWidth];
		this.startX = startX;
		this.startY = startY;
		this.blockWidth = blockWidth;
		this.blockHeight = blockHeight;

		this.lastUpdate = 0;
		this.delay = 100;

		for (int i = 0; i < blockHeight; i++) {
			for (int j = 0; j < blockWidth; j++) {
				int x = this.startX + j * DELTA_X;
				int y = this.startY + i * DELTA_Y;
				this.block[i][j] = new Invader(x, y);
			}
		}
	}

	/**
	   Draws every Invader object in this InvaderBlock
	 */
	public void render() {
		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.render();
			}
		}
	}

	public void update() {
		if (millis() > this.lastUpdate + this.delay) {
			this.lastUpdate = millis();

			if (this.flipCheck()) {
				this.flip();
			}

			for (Invader[] i : this.block) {
				for (Invader j : i) {
					j.update();
				}
			}
		}
	}

	public boolean flipCheck() {
		if (this.getRightmost().getX() >= width-BORDER) {
			return true;
		}

		if (this.getLeftmost().getX() <= BORDER) {
			return true;
		}

		return false;
	}

	public Invader getRightmost() {
		for (int i = this.blockWidth-1; i >= 0; i--) {
			for (int j = 0; j < this.blockHeight; j++) {
				if (this.block[j][i].isAlive()) {
					return this.block[j][i];
				}
			}
		}
		return new Invader(0, 0);
	}

	public Invader getLeftmost() {
		for (int i = 0; i < this.blockWidth; i++) {
			for (int j = 0; j < this.blockHeight; j++) {
				if (this.block[j][i].isAlive()) {
					return this.block[j][i];
				}
			}
		}
		return new Invader(0, 0);
	}

	private void flip() {
		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.flip();
				j.downLevel();
			}
		}
	}
}
