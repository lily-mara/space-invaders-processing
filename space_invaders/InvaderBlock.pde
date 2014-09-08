public class InvaderBlock {
	private Invader[][] block;
	private int width;
	private int height;
	private int startX;
	private int startY;

	/**
	   An instance of InvaderBlock class is a collection of Invader objects
	   @param width the number of invaders in each row of block
	   @param height the number of invaders in each column of block
	   @param startX the initial left boundary of the block
	   @param startY the initial upper boundary of the block
	*/
	public InvaderBlock(int width, int height, int startX, int startY) {
		this.block = new Invader[height][width];
		this.startX = startX;
		this.startY = startY;
		this.width = width;
		this.height = height;

		for (int i = 0; i < height; i++) {
			for (int j = 0; j < width; j++) {
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
		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.render();
				j.update();
			}
		}
	}
}
