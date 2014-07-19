
boolean isBlockStuck(Game game)
{
  boolean[][] blocks = game.blocks;

  Block block = game.fallingBlock;  
  BlockPart[] parts = block.parts;
  
  boolean stuck = block.yPos + 1 >= game.wellHeight;
  for (int i = 0; (i < BlockPartsCount) && (!stuck); i++) {
    stuck = stuck
      || parts[i].yPos + 1 >= game.wellHeight
      || blocks[parts[i].xPos][parts[i].yPos + 1];
  }
  
  return stuck;
}

void fixateBlock(Game game) {
  Block block = game.fallingBlock;  
  BlockPart[] parts = block.parts;
  
  for (int i = 0; i < BlockPartsCount; i++) {
    game.blocks[parts[i].xPos][parts[i].yPos] = true;
  }
  game.fallingBlock = null;
}

void generateNextBlock(Game game) {
  // Not implemented yet
}

Game updateGameState(Game game) {
  Game currentGame = game;
  
  if (currentGame.fallingBlock != null) {
         
    if (isBlockStuck(currentGame)) {
      fixateBlock(currentGame);
      generateNextBlock(currentGame);
    } else {
      moveBlockDown(currentGame.fallingBlock); 
    }
  }
  
  return currentGame;
}

boolean isGameOver(Game currentGame) {
  // Not implemented yet
  return false;
}




