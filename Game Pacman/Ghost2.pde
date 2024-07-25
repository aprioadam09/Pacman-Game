PImage ghost2left, ghost2right, ghost2up, ghost2down;

class ghost2 {
 int ghost2x, ghost2y;
 int lastdirection2;
 int lastMoveTime2; // Waktu terakhir pergerakan
 int moveInterval2 = 200; // Interval pergerakan (milidetik). Sesuaikan dengan kecepatan yang diinginkan
 int chaseDistance2 = 5; // Jarak dalam langkah yang Ghost akan bergerak mengejar Pacman

 final int UP = 0;
 final int DOWN = 1;
 final int LEFT = 2;
 final int RIGHT = 3;

 ghost2 (int initialX, int initialY){
 ghost2x = initialX;
 ghost2y = initialY;
 lastdirection2 = UP;
  
 ghost2left = loadImage("ghost-hijau-left.png");
 ghost2right = loadImage("ghost-hijau-right.png");
 ghost2up = loadImage("ghost-hijau-up.png");
 ghost2down = loadImage("ghost-hijau-down.png");
 }

 void moveUp() {
  if (ghost2y > 0 && map[ghost2y - 1][ghost2x] != 1) {
    ghost2y--;
    lastdirection2 = UP;
  }
 }

 void moveDown() {
  if (ghost2y < rows - 1 && map[ghost2y + 1][ghost2x] != 1) {
    ghost2y++;
    lastdirection2 = DOWN;
  }
 }

 void moveLeft() {
  if (ghost2x > 0 && map[ghost2y][ghost2x - 1] != 1) {
    ghost2x--;
    lastdirection2 = LEFT;
  }
 }

 void moveRight() {
  if (ghost2x < cols - 1 && map[ghost2y][ghost2x + 1] != 1) {
    ghost2x++;
    lastdirection2 = RIGHT;
  }
 }

 void move () {
  if (millis() - lastMoveTime2 > moveInterval2) {
    lastMoveTime2 = millis();
    int distanceX = abs(Pacman.pacmanx - ghost2x);
    int distanceY = abs(Pacman.pacmany - ghost2y);
    if (distanceX <= chaseDistance2 && distanceY <= chaseDistance2) {
      // Jika Ghost dekat dengan Pacman, bergerak menuju arah Pacman
      if (Pacman.pacmanx > ghost2x) {
        moveRight();
      } else if (Pacman.pacmanx < ghost2x) {
        moveLeft();
      } else if (Pacman.pacmany > ghost2y) {
        moveDown();
      } else if (Pacman.pacmany < ghost2y) {
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
  switch (lastdirection2) {
    case UP:
      image(ghost2up, ghost2x * cellSize + ((cellSize-30)/2), ghost2y * cellSize + ((cellSize-30)/2));
      break;
    case DOWN:
      image(ghost2down, ghost2x * cellSize + ((cellSize-30)/2), ghost2y * cellSize + ((cellSize-30)/2));
      break;
    case LEFT:
      image(ghost2left, ghost2x * cellSize + ((cellSize-30)/2), ghost2y * cellSize + ((cellSize-30)/2));
      break;
    case RIGHT:
      image(ghost2right, ghost2x * cellSize + ((cellSize-30)/2), ghost2y * cellSize + ((cellSize-30)/2));
      break;
  }
 }
}
