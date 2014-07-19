

class Game {
  int wellWidth;
  int wellHeight;
  
  Game (int w, int h) {
    wellWidth = w;
    wellHeight = h;
    fallingBlock = null;
    
    blocks = new boolean[w][h];
    for (int x = 0; x < w; x++)
      for (int y = 0; y < h; y++)
        blocks[x][y] = false;
  }
  
  boolean[][] blocks;
  Block fallingBlock;
};


boolean isBlockStuck(Game game)
{
  Block block = game.fallingBlock;
  boolean[][] blocks = game.blocks;
  
  // TODO: check all block parts
  return (block.yPos + 1 >= game.wellHeight)
      || (blocks[block.xPos][block.yPos + 1]);
}

boolean validateFallingBlockPos(Game game) {
  return true;
}

void fixateBlock(Game game) {
  // Not implemented yet
}

void generateNextBlock(Game game) {
  // Not implemented yet
}

Game updateGameState(Game game) {
  Game currentGame = game;
  
  if (currentGame.fallingBlock != null) {
    
    // Debug only
    if (!validateFallingBlockPos(currentGame)) {
      println("invalid block pos.");
    }
      
    if (isBlockStuck(currentGame)) {
      fixateBlock(currentGame);
      generateNextBlock(currentGame);
    }
  }
  
  return currentGame;
}

boolean isGameOver(Game currentGame) {
  // Not implemented yet
  return false;
}


