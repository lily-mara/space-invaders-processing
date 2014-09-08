public class InvaderBlock {
	private final int BORDER = 40;
	private final int X_SPACING = 50;
	private final int Y_SPACING = 60;

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
				int x = this.startX + j * X_SPACING;
				int y = this.startY + i * Y_SPACING;
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

	/**
	   If the appropriate delay has elapsed, then update the positions
	   of the invaders in this block
	 */
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

	/**
	   Check if this block needs to be flipped (if the left/rightmost
	   invader has reached a border)

	   @return true if the block needs to be flipped, false otherwise
	 */
	public boolean flipCheck() {
		if (this.getRightmost().getX() >= width-BORDER) {
			return true;
		}

		if (this.getLeftmost().getX() <= BORDER) {
			return true;
		}

		return false;
	}

	/**
	   Returns the rightmost Invader in this block that is alive (no
	   assumptions should be made about the height of the Invader)

	   @return rightmost Invader in this block
	 */
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

	/**
		Returns true if the lowest alive Invader is at or below the
		given height false otherwise

		@param height the height to check if the lowest Invader has reached
		@return true if height has been breached false otherwise
	 */
	public boolean belowHeight(int height) {
		return this.getLowest().getY() >= height;
	}
	
	
	/**
	   Returns the leftmost Invader in this block that is alive (no
	   assumptions should be made about the X of the Invader)

	   @return leftmost Invader in this block
	 */
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

	/**
	   Returns the lowest Invader in this block that is alive (no
	   assumptions should be made about the height of the Invader)

	   @return lowest Invader in this block
	 */
	public Invader getLowest() {
		for (int i = this.blockHeight - 1; i >= 0; i--) {
			for (int j = 0; j < this.blockWidth; j++) {
				if (this.block[i][j].isAlive()) {
					return this.block[i][j];
				}
			}
		}
		return new Invader(0, 0);
	}

	/**
	   If the block is moving right, make it move left and
	   vice-versa. Also, decrease the delay by 20ms, and move the
	   block down a level.
	 */
	private void flip() {
		if (this.delay > 0) {
			this.delay -= 20;
		}

		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.flip();
				j.downLevel();
			}
		}
	}
}
