static final int w = 4;
static final int h = 10; // 60
static final int framesInSecond = 30;
static final float gameSpeed = framesInSecond / 1.0;

float updatingThreshold = 0;
Game game;

float recalculateUpdatingThreshold(float threshold) {
  return threshold + 1;
}

void drawTestRect()
{
  fill(0xFF000000 | (int)random(0xFFFFFF));
  rect(1*BlockScale, 1*BlockScale, BlockScale, BlockScale);
}

void setup() {

  game = new Game(w, h);
  game.fallingBlock = createBlock(I, 0, 0, East);
  
  /*
  // Debug
  Block block = createBlock(I, North, 0, w);
  for (int i = 0; i < 4; i++)
    println("i: (" + block.parts[i].xPos + ", " + block.parts[i].yPos + ")");
  */  
  
  size(w*BlockScale + 1, h*BlockScale + 1);

  frameRate(framesInSecond);
}

void draw() {

  background(0); 
  Game newGame = game;
  
  updatingThreshold = recalculateUpdatingThreshold(updatingThreshold);
 
  if (updatingThreshold > gameSpeed) {
    newGame = updateGameState(game);
    
    if (isGameOver(newGame)) {
       // Do something on end of game
    }
     
     updatingThreshold = 0;
  }
  
  drawGameState(newGame);
}

void keyPressed() {
}

