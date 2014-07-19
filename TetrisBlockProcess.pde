
BlockPart[] getIBlockParts(int direction) {
  BlockPart[] parts = new BlockPart[BlockPartsCount];
  
  if ((direction == East) || (direction == West)) {
     parts[0] = new BlockPart(0,0);
     parts[1] = new BlockPart(1,0);
     parts[2] = new BlockPart(2,0);
     parts[3] = new BlockPart(3,0); 
  } else {
     parts[0] = new BlockPart(0,1);
     parts[1] = new BlockPart(0,2);
     parts[2] = new BlockPart(0,3);
     parts[3] = new BlockPart(0,4); 
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

Block generateFallingBlock() {
  
  // TODO: dummy, fix me
  Block block = new Block(0,0,0,0);
  block.parts = getIBlockParts(0);
  
  return block;
}
