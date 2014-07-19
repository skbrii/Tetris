
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

void eraseFilledLines(Game game) {
  
 for (int y = game.wellHeight - 1; y >= 0;) {
   
   boolean erasable = true;
   for (int x = 0; x < game.wellWidth; x++)
     erasable = erasable && game.blocks[x][y];
    
   if (erasable) {
     
     // Move blocks down
     for (int y2 = y - 1; y2 >= 0; y2--)
       for (int x = 0; x < game.wellWidth; x++)
         game.blocks[x][y2 + 1] = game.blocks[x][y2];
    
     // Top level needs to be cleared.
     for (int x = 0; x < game.wellWidth; x++)
       game.blocks[x][0] = false;
   
   } else {
     y--;
   }
 }
 
 game.erasingNeeded = false;
}

void enableErasing(Game game) {
 game.erasingNeeded = true; 
}

void generateNextBlock(Game game) {
  // Not implemented yet
}

Game updateGameState(Game game) {
  Game currentGame = game;
  
  if (currentGame.erasingNeeded) {
    eraseFilledLines(currentGame);
  } else if (currentGame.fallingBlock != null) {
    if (isBlockStuck(currentGame)) {
      fixateBlock(currentGame);
      enableErasing(currentGame);
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




