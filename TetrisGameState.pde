int I = 0;
int O = 1;
int T = 2;
int S = 3;
int Z = 4;
int J = 5;
int L = 6;

int North = 0;
int East = 1;
int South = 2;
int West = 3;

class Block {
  int type;
  int xPos;
  int yPos;
  int direction;
  
  Block (int blockType, int blockXPos, int blockYPos, int blockDirection) {
    type = blockType;
    xPos = blockXPos;
    yPos = blockYPos;
    direction = blockDirection;
  }
};

class Game {
  int wellWidth;
  int wellHeight;
  
  Game (int w, int h) {
    wellWidth = w;
    wellHeight = h;
    currentBlock = null;
    
    blocks = new boolean[w][h];
    for (int x = 0; x < w; x++)
      for (int y = 0; y < h; y++)
        blocks[x][y] = false;
  }
  
  boolean[][] blocks;
  Block currentBlock;
};

boolean isBlockStuck(Game game)
{
  Block block = game.currentBlock;
  boolean[][] blocks = game.blocks;
  
  return (block.yPos + 1 >= game.wellHeight)
      || (blocks[block.xPos][block.yPos + 1]);
}

boolean validateCurrentBlockPos(Game game) {
  return true;
}

Game updateGameState(Game game) {
  Game updatedGame = game;
  
  if (game.currentBlock != null) {
    
    // Debug only
    if (!validateCurrentBlockPos(game)) {
      println("invalid block pos.");
    }
      
    boolean moved = isBlockStuck(game);
  }
  
  return updatedGame;
}

boolean isGameOver(Game currentGame) {
  // Not implemented yet
  return false;
}


