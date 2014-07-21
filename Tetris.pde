static final int w = 10; // 4
static final int h = 30; // 60
static final int framesInSecond = 30;
static final float gameSpeed = framesInSecond / 5.0; // moving down ~5 times in second

float updatingThreshold = 0;
Game game;

float recalculateUpdatingThreshold(float threshold) {
  return threshold + 1;
}

void setup() {

  game = new Game(w, h);
  generateRandomBlock(game);
  
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
      //exit();
    }
     
     updatingThreshold = 0;
  }
  
  drawGameState(newGame);
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case LEFT:  moveBlock(game, MoveLeft);  break;
      case RIGHT: moveBlock(game, MoveRight); break;
      case DOWN:  makeBlockFall(game);        break;
      case UP:    rotateBlock(game);          break;
    }
  } else if (key == ' ') { // SPACE
      rotateBlock(game);
    }
}

