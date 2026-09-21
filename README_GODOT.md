# PocketVoxel — Godot engine

This is the beginning of the standalone Godot version of PocketVoxel.

The browser prototype remains in index.html. The Godot project is intended to become the main high-performance version.

## Current foundation

- Godot 4 project
- Typed-array chunk storage
- 16x16x64 chunk structure
- Deterministic terrain height generation
- CharacterBody3D player
- Mouse-look FPS camera
- WASD movement
- Jumping
- Sprinting
- GL compatibility renderer for broad hardware support

## Next engine work

1. Build exposed-face chunk meshes with SurfaceTool/ArrayMesh.
2. Generate collision meshes only for solid exposed terrain.
3. Add chunk streaming around the player.
4. Move chunk generation to worker threads.
5. Add block interaction and a hotbar.
6. Add save/load.
7. Add water, caves, ores and mobs.
