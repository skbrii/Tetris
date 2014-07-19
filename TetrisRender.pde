static final int windowScale = 8;

void drawWell(int w, int h)
{
  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      stroke(0x55660000);
      rect(x*windowScale, y*windowScale, windowScale, windowScale);
    }
  }
}

void drawGameState(Game game)
{
  drawWell(game.wellWidth, game.wellHeight);
  
}
