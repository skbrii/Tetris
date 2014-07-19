
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

BlockPart[] projectBlockParts(BlockPart[] parts, Block block) {
  
  
}
