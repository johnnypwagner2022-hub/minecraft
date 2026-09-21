# PocketVoxel architecture

This folder documents the next optimization layer. The browser prototype currently renders a small world with instanced cubes. The target architecture is chunked voxel storage with face culling and streamed rebuilds.

## Planned chunk system

- 16 x 16 x 64 chunks
- Integer block IDs stored in typed arrays
- Only exposed faces emitted
- Dirty chunks rebuild only when edited
- Neighbor chunks mark their border dirty when an edge block changes
- World generation is deterministic from a seed
- Active chunks follow the player instead of keeping the whole world loaded

## Performance priorities

1. Avoid one JavaScript object per block.
2. Avoid rebuilding every block mesh after one edit.
3. Generate and mesh chunks incrementally.
4. Keep draw calls low.
5. Cap device pixel ratio on mobile.
6. Use Web Workers for generation/meshing when the chunk system is introduced.
