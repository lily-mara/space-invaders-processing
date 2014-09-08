public class InvaderBlock {
	private Invader[][] block;
	private int width;
	private int height;
	private int startX;
	private int startY;

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

	public void render() {
		for (Invader[] i : this.block) {
			for (Invader j : i) {
				j.render();
				j.update();
			}
		}
	}
}