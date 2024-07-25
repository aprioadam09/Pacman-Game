PImage ghostleft, ghostright, ghostup, ghostdown;

class ghost {
 int ghostx, ghosty;
 int lastdirection;
 int lastMoveTime; // Waktu terakhir pergerakan
 int moveInterval = 200; // Interval pergerakan (milidetik). Sesuaikan dengan kecepatan yang diinginkan
 int chaseDistance = 5; // Jarak dalam langkah yang Ghost akan bergerak mengejar Pacman

 final int UP = 0;
 final int DOWN = 1;
 final int LEFT = 2;
 final int RIGHT = 3;

 ghost (int initialX, int initialY){
   ghostx = initialX;
   ghosty = initialY;
   lastdirection = UP;
  
   ghostleft = loadImage("ghost-merah-left.png");
   ghostright = loadImage("ghost-merah-right.png");
   ghostup = loadImage("ghost-merah-up.png");
   ghostdown = loadImage("ghost-merah-down.png");
 }

 void moveUp() {
  if (ghosty > 0 && map[ghosty - 1][ghostx] != 1) {
    ghosty--;
    lastdirection = UP;
  }
 }
 void moveDown() {
  if (ghosty < rows - 1 && map[ghosty + 1][ghostx] != 1) {
    ghosty++;
    lastdirection = DOWN;
  }
 }
 void moveLeft() {
  if (ghostx > 0 && map[ghosty][ghostx - 1] != 1) {
    ghostx--;
    lastdirection = LEFT;
  }
 }
 void moveRight() {
  if (ghostx < cols - 1 && map[ghosty][ghostx + 1] != 1) {
    ghostx++;
    lastdirection = RIGHT;
  }
 }

 void move () {
  if (millis() - lastMoveTime > moveInterval) {
    lastMoveTime = millis();
    int distanceX = abs(Pacman.pacmanx - ghostx);
    int distanceY = abs(Pacman.pacmany - ghosty);
    if (distanceX <= chaseDistance && distanceY <= chaseDistance) {
      // Jika Ghost dekat dengan Pacman, bergerak menuju arah Pacman
      if (Pacman.pacmanx > ghostx) {
        moveRight();
      } else if (Pacman.pacmanx < ghostx) {
        moveLeft();
      } else if (Pacman.pacmany > ghosty) {
        moveDown();
      } else if (Pacman.pacmany < ghosty) {
        moveUp();
      }
    } else {
      // Jika Ghost jauh dari Pacman, bergerak secara acak
      int direction = (int) random(4);
      switch (direction) {
        case UP:
          moveUp();
          break;
        case DOWN:
          moveDown();
          break;
        case LEFT:
          moveLeft();
          break;
        case RIGHT:
          moveRight();
          break;
      }
    }
  }
 }

 void display (){
  switch (lastdirection) {
    case UP:
      image(ghostup, ghostx * cellSize + ((cellSize-30)/2), ghosty * cellSize + ((cellSize-30)/2));
      break;
    case DOWN:
      image(ghostdown, ghostx * cellSize + ((cellSize-30)/2), ghosty * cellSize + ((cellSize-30)/2));
      break;
    case LEFT:
      image(ghostleft, ghostx * cellSize + ((cellSize-30)/2), ghosty * cellSize + ((cellSize-30)/2));
      break;
    case RIGHT:
      image(ghostright, ghostx * cellSize + ((cellSize-30)/2), ghosty * cellSize + ((cellSize-30)/2));
      break;
  }
 }
}
