public class InvaderBlock {
	private final int BORDER = 40;

	private Invader[][] block;
	private int blockWidth;
	private int blockHeight;
	private int startX;
	private int startY;

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

		for (int i = 0; i < blockHeight; i++) {
			for (int j = 0; j < blockWidth; j++) {
				int newX = this.startX + (j*50);
				int newY = this.startY + sDeltaY * i;
				this.block[i][j] = new Invader(newX, newY);
			}
		}
	}

	/**
	   Draws every Invader object in this InvaderBlock
	 */
	public void render() {
		if (this.block[0][this.blockWidth-1].getX() >= width-BORDER) {
			this.flip();
		}
		
		if (this.block[0][0].getX() <= BORDER) {
			this.flip();
		}

		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.render();
				j.update();
			}
		}
	}
	
	private void flip() {
		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.flip();
			}
		}
	}
}
