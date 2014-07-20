BlockPart[] getIBlockParts(int direction) {
  BlockPart[] parts = new BlockPart[BlockPartsCount];
  if ((direction == East) || (direction == West)) {
     parts[0] = new BlockPart(0,0);
     parts[1] = new BlockPart(1,0);
     parts[2] = new BlockPart(2,0);
     parts[3] = new BlockPart(3,0); 
  } else {
     parts[0] = new BlockPart(0,0);
     parts[1] = new BlockPart(0,1);
     parts[2] = new BlockPart(0,2);
     parts[3] = new BlockPart(0,3); 
  }
  return parts;
}

BlockPart[] getOBlockParts() {
  BlockPart[] parts = new BlockPart[BlockPartsCount];
  parts[0] = new BlockPart(0,0);
  parts[1] = new BlockPart(1,0);
  parts[2] = new BlockPart(0,1);
  parts[3] = new BlockPart(1,1); 
  return parts;
}

BlockPart[] getTBlockParts(int direction) {
  BlockPart[] parts = new BlockPart[BlockPartsCount];
  switch (direction) {
    case East:
         parts[0] = new BlockPart(0,0);
         parts[1] = new BlockPart(1,0);
         parts[2] = new BlockPart(2,0);
         parts[3] = new BlockPart(1,1);
         break;
    case South:
         parts[0] = new BlockPart(1,0);
         parts[1] = new BlockPart(0,1);
         parts[2] = new BlockPart(1,1);
         parts[3] = new BlockPart(1,2);
         break;
    case North:
         parts[0] = new BlockPart(1,0);
         parts[1] = new BlockPart(0,1);
         parts[2] = new BlockPart(1,1);
         parts[3] = new BlockPart(2,1);
         break;
    case West:
         parts[0] = new BlockPart(0,0);
         parts[1] = new BlockPart(0,1);
         parts[2] = new BlockPart(1,1);
         parts[3] = new BlockPart(0,2);
         break;
  }
  return parts;
}

BlockPart[] getBlockParts(Block block) {
  switch(block.type) {
    case I: return getIBlockParts(block.direction);
    case O: return getOBlockParts();
    case T: return getTBlockParts(block.direction);

    // TODO: implement other blocks
  }
  
  // TODO: debug only
  return getIBlockParts(block.direction);
}

void moveBlockDown(Block block) {
  block.yPos += 1;
  for (int i = 0; i < BlockPartsCount; i++) {
   block.parts[i].yPos += 1;
  }
}

// We assume, only unsigned int is possible in block parts[i].xPos.
// TODO: adjust yPos
void arrangeNewBlock(Block block, int wellWidth) {
  
  int rightYShift = 0;
  int leftXShift = 0;
  int maxYShift = 0;
  for (int i = 0; i < BlockPartsCount; i++) {
    
    maxYShift = max (block.parts[i].yPos, maxYShift);
    
    block.parts[i].xPos = block.parts[i].xPos + block.xPos;
   
    if (block.parts[i].xPos >= wellWidth)
      leftXShift = max(leftXShift, block.parts[i].xPos + 1 - wellWidth);
  }
  
  for (int i = 0; i < BlockPartsCount; i++) {
    block.parts[i].xPos = block.parts[i].xPos - leftXShift;
    block.parts[i].yPos = block.parts[i].yPos - (1 + maxYShift);
  }
  
  block.yPos = -1;
}

// TODO: adjust yPos
Block createBlock(int type, int direction, int xPos, int yPos, int wellWidth) {
  Block block = new Block(type, xPos, yPos, direction);
  block.parts = getBlockParts(block);
  arrangeNewBlock(block, wellWidth);  
  return block;
}
