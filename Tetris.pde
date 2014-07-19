static final int w = 4;
static final int h = 60;
static final int framesInSecond = 30;
static final float gameSpeed = framesInSecond / 1.0;

float updateCycleThreshold = 0;
Game game;

float calculateUpdateThreshold(float updateThreshold) {
  return updateThreshold + 1;
}

void drawTestRect()
{
  fill(0xFF000000 | (int)random(0xFFFFFF));
  rect(1*BlockScale, 1*BlockScale, BlockScale, BlockScale);
}

void setup() {

  game = new Game(w, h);
  game.fallingBlock = generateFallingBlock();
  size(w*BlockScale + 1, h*BlockScale + 1);

  frameRate(framesInSecond);
}

void draw() {

  background(0); 
  Game newGame = game;
  
  updateCycleThreshold = calculateUpdateThreshold(updateCycleThreshold);
 
  if (updateCycleThreshold > gameSpeed) {
    newGame = updateGameState(game);
    
    if (isGameOver(newGame)) {
       // Do something on end of game
    }
     
     updateCycleThreshold = 0;
  }
  
  drawGameState(newGame);
}

void keyPressed() {
}

