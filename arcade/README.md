# Pocket Arcade

A browser arcade added as a separate folder so it does not replace the original PocketVoxel project.

## Play locally
Open `index.html` in a browser, or publish the repository with GitHub Pages and visit the `/arcade/` path.

## Imported games and attribution
- **2048** — source from [gabrielecirulli/2048](https://github.com/gabrielecirulli/2048), copyright Gabriele Cirulli. Its MIT license is included at `2048/LICENSE.txt`.
- **Tetris** — source from [jakesgordon/javascript-tetris](https://github.com/jakesgordon/javascript-tetris), copyright Jake Gordon and contributors. Its MIT license is included at `tetris/LICENSE`. The display texture reference was removed because this repository does not include that binary image; the game uses a plain background instead.
- Snake, Memory Match, Brick Breaker, and the arcade launcher are original self-contained HTML/JavaScript implementations added here.

## Pocket Gridiron and Retro Bowl
An original, self-contained browser football game is available at `gridiron/index.html`. It was created for this arcade and does not copy Retro Bowl game assets or proprietary source code.

The homepage links to the official licensed browser version of Retro Bowl on [Poki](https://poki.com/en/g/retro-bowl). The proprietary game package is not copied into this repository.

## Cloudflare Pages
For easy drag-and-drop deployment, download the separate Pocket Arcade static deploy bundle provided in chat, unzip it, and upload the folder contents with the top-level `index.html`. Full instructions are in `README-DEPLOY.md` in that bundle.
