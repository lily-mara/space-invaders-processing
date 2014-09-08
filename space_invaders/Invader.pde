public class Invader {
	private int posX;
	private int posY;
	private boolean isAlive = true;

	public Invader(int posX, int posY) {
		this.posX = posX;
		this.posY = posY;
	}

	void render() {
		// this massive steaming pile of code creates one Space Invader.
		// I will not be making the other 5 types...
		rect(this.posX, this.posY + 5, 28, 8);
		rect(this.posX, this.posY, 12, 16);
		rect(this.posX - 12, this.posY + 10, 4, 4);
		rect(this.posX + 12, this.posY + 10, 4, 4);
		rect(this.posX - 6, this.posY + 14, 8, 4);
		rect(this.posX + 6, this.posY + 14, 8, 4);
		rect(this.posX - 8, this.posY - 10, 4, 4);
		rect(this.posX + 8, this.posY - 10, 4, 4);
		rect(this.posX - 12, this.posY - 14, 4, 4);
		rect(this.posX + 12, this.posY - 14, 4, 4);
		rect(this.posX - 10, this.posY - 6, 8, 4);
		rect(this.posX + 10, this.posY - 6, 8, 4);
		rect(this.posX - 12, this.posY - 1, 4, 6);
		rect(this.posX + 12, this.posY - 1, 4, 6);
		rect(this.posX - 16, this.posY - 0, 4, 8);
		rect(this.posX + 16, this.posY - 0, 4, 8);
		rect(this.posX - 20, this.posY + 6, 4, 12);
		rect(this.posX + 20, this.posY + 6, 4, 12);
	}

}
