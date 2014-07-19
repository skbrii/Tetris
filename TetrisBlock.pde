// Classic Tetris only blocks
static final int blockPartsCount = 4;

static final int I = 0;
static final int O = 1;
static final int T = 2;
static final int S = 3;
static final int Z = 4;
static final int J = 5;
static final int L = 6;

static final int North = 0;
static final int East = 1;
static final int South = 2;
static final int West = 3;

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

class BlockPart {
  int xPos;
  int yPos;
  
  BlockPart(int blockXPos, int blockYPos) {
   xPos = blockXPos;
   yPos = blockYPos;    
  }  
};

