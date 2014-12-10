/* @pjs font="Courier.vlw"; */

/**
   @author Nate Mara
   @author Evan Baker
   @author Daltin Loomis

   @date 2013-10-12
   @version 0.0.4 2014-09-11

   The game "Space Invaders" implemented in Processing.
*/

// Constants
final int INVADER_BLOCK_START_X = 75;
final int INVADER_BLOCK_START_Y = 100;

// Variables that store game logic
InvaderBlock invaders;
Player player;
Roof[] roofs;
Collisions collisions;

PFont pixelFont;

void setup() {
	size(651, 744);
	textSize(30);

	pixelFont = loadFont("Courier.vlw");

	noStroke();
	invaders = new InvaderBlock(11, 5, INVADER_BLOCK_START_X, INVADER_BLOCK_START_Y);
	player = new Player();
	collisions = new Collisions();

	roofs = new Roof[4];
	for (int i = 0; i < roofs.length; i++) {
		roofs[i] = new Roof(50 + i*150, 525);
	}

	for (Roof r : roofs) {
		for (Rectangle rect : r.getRectangles()) {
			collisions.addCollision(rect, player.getBulletCollidable());
		}
	}

	for (Invader i : invaders.getInvaders()) {
		collisions.addCollision(player, i);
		collisions.addCollision(player.getBulletCollidable(), i);
		for (Roof r : roofs) {
			for (Rectangle rect : r.getRectangles()) {
				collisions.addCollision(rect, i);
			}
		}
	}
}

void draw() {
	if (player.getLives() > 0) {
		background(0);
		renderGUI();
		invaders.render();
		invaders.update();
		player.update();
		collisions.update();

		for (Roof r : roofs) {
			r.render();
		}

		if (invaders.belowHeight(500)) {
			player.kill();
			invaders.reset(true);
		}
	} else {
		fill(#FF6600);
		background(0);
		textAlign(CENTER);
		textFont(pixelFont, 20);

		text("GAME OVER", width/2, height/2 - 30);
		text("SCORE:", width/2, height/2 + 20);
		text(player.getScore(), width/2, height/2 + 50);
	}
}

/**
   Every time the mouse is pressed, shoot a laser beam
 */
void mousePressed() {
	player.shoot();
}

/**
   Draw the score in top-left corner of screen
 */
void renderGUI() {
	fill(255);
	textFont(pixelFont, 20);
	text("SCORE: " + player.getScore(), 50, 20);
}
