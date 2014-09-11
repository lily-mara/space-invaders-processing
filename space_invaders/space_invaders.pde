/**
   @author Nate Mara
   @author Evan Baker
   @author Daltin Loomis

   @date 2013-10-12

   The game "Space Invaders" implemented in Processing.
*/

// Constants
final int INVADER_BLOCK_START_X = 75;
final int INVADER_BLOCK_START_Y = 100;

// Variables that store game logic
InvaderBlock invaders;
Player player;
Roof[] roofs;

PFont pixelFont;

void setup() {
	size(651, 744);
	textSize(30);

	pixelFont = loadFont("Courier.vlw");

	noStroke();
	invaders = new InvaderBlock(11, 5, INVADER_BLOCK_START_X, INVADER_BLOCK_START_Y);
	player = new Player();

	player.addInvaders(invaders.getInvaders());

	roofs = new Roof[4];
	for (int i = 0; i < roofs.length; i++) {
		roofs[i] = new Roof(50 + i*150, 525);
		player.addRectangles(roofs[i].getRectangles());
	}
}

void draw() {
	if (true) {
		background(0);
		renderGUI();
		invaders.render();
		invaders.update();
		player.update();

		for (Roof r : roofs) {
			r.render();
		}

		if (invaders.belowHeight(500)) {
			player.die();
			invaders.reset(true);
		}
	} else {
		fill(#FF6600);
		background(0);
		textAlign(CENTER);
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
