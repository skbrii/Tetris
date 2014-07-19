// Classic Tetris only blocks
int blockPartsCount = 4;

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

point[] getBlockParts(Block block) {
  point[] parts = new point[blockPartsCount];
  
  switch(block.type) {
    case I: parts[0] = point(0,0);
            parts[1] = point(1,0);
            parts[2] = point(2,0);
            parts[3] = point(3,0);
          break;
    // TODO: implement other blocks
          
    // Debug only
    default:
            parts[0] = point(0,0);
            parts[1] = point(1,0);
            parts[2] = point(2,0);
            parts[3] = point(3,0);
  }
  return parts;
}

