int w = 4;
int h = 60;
int framesInSecond = 30;
float gameSpeed = framesInSecond / 1.0;
float updateCycleThreshold = 0;

Game game;

float calculateUpdateThreshold(float updateThreshold) {
  return updateThreshold + 1;
}

void drawTestRect()
{
  fill(0xFF000000 | (int)random(0xFFFFFF));
  rect(1*windowScale, 1*windowScale, windowScale, windowScale);
}

void setup() {

  game = new Game(w, h);
  size(w*windowScale + 1, h*windowScale + 1);

  frameRate(framesInSecond);
}

void draw() {

  background(0); 
  Game newGame = game;
  
  updateCycleThreshold = calculateUpdateThreshold(updateCycleThreshold);
 
  if (updateCycleThreshold > gameSpeed) {
    newGame = updateGameState(game);
    drawTestRect();
    
    if (isGameOver(newGame)) {
       // Do something on end of game
    }
     
     updateCycleThreshold = 0;
  }
  
  drawGameState(newGame); 
}

void keyPressed() {
}

