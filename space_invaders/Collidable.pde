interface Collidable {
	/**
	   returns the x-cordinate of the upper-left corner of this object

	   @return x-cordinate of the upper-left corner of this object
	 */
	public int getX();

	/**
	   returns the y-cordinate of the upper-left corner of this object

	   @return y-cordinate of the upper-left corner of this object
	 */
	public int getY();

	/**
	   returns the width of this object

	   @return width of this object
	 */
	public int getWidth();

	/**
	   returns the height of this object

	   @return height of this object
	 */
	public int getHeight();

	/**
	   returns the alive status of this object

	   @return wether or not this object is alive
	 */
	public boolean isAlive();

	/**
	   Kill this object. Either decrement its lives by one or stop
	   rendering it/colliding with it
	 */
	public void kill();
}
