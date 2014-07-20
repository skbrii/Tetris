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

BlockPart[] getBlockParts(Block block) {
  switch(block.type) {
    case I: return getIBlockParts(block.direction);

    // TODO: implement other blocks

    default: break;
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

// We assume, only unsigned int is possible in block parts[i].xPos .
// yPos can be negative.
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
}

Block createBlock(int type, int direction, int xPos, int wellWidth) {
  Block block;
 
  switch (type) {
   case I: block = new Block(type, xPos, 0, direction); break;
   
   // TODO: debug only
   default: block = new Block(type, xPos, 0, direction); break;
  }
  
  block.parts = getIBlockParts(direction);
  arrangeNewBlock(block, wellWidth);  
  return block;
}
