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

BlockPart[] getBlockParts(Block block) {
  BlockPart[] parts = new BlockPart[blockPartsCount];
  
  switch(block.type) {
    case I: parts[0] = new BlockPart(0,0);
            parts[1] = new BlockPart(1,0);
            parts[2] = new BlockPart(2,0);
            parts[3] = new BlockPart(3,0);
          break;
    // TODO: implement other blocks
          
    // Debug only
    default:
            parts[0] = new BlockPart(0,0);
            parts[1] = new BlockPart(1,0);
            parts[2] = new BlockPart(2,0);
            parts[3] = new BlockPart(3,0);
          break;
  }
  return parts;
}


