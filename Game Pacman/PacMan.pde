PImage pacmanleft, pacmanright, pacmanup, pacmandown;

class pacman {
  int pacmanx, pacmany;
  int lastdirection;
  private int score;
  int lastMoveTime;  // Waktu terakhir pergerakan
  int moveInterval = 100;  // Interval pergerakan (milidetik). Sesuaikan dengan kecepatan yang diinginkan
  
  pacman (){
    pacmanx = 12;
    pacmany = 4;
    score = 0;
    lastdirection = RIGHT;
    
    pacmanleft = loadImage("pacmanleft.png");
    pacmanright = loadImage("pacmanright.png");
    pacmanup = loadImage("pacmanup.png");
    pacmandown = loadImage("pacmandown.png");
  }
  
  void move () {
    if (keyPressed && millis() - lastMoveTime > moveInterval) {
      lastMoveTime = millis();
      if (keyCode == UP && pacmany > 0 && map[pacmany - 1][pacmanx] != 1) {
        pacmany--;
      } else if (keyCode == DOWN && pacmany < rows - 1 && map[pacmany + 1][pacmanx] != 1) {
        pacmany++;
      } else if (keyCode == LEFT && pacmanx > 0 && map[pacmany][pacmanx - 1] != 1) {
        pacmanx--;
      } else if (keyCode == RIGHT && pacmanx < cols - 1 && map[pacmany][pacmanx + 1] != 1) {
        pacmanx++;
      }
    }
  }
  
  void display (){
    if (keyPressed) {
     if (keyCode == UP) {
        image(pacmanup, pacmanx * cellSize + ((cellSize-30)/2), pacmany * cellSize + ((cellSize-30)/2));
        lastdirection = UP;
      } else if (keyCode == DOWN) {
        image(pacmandown, pacmanx * cellSize + ((cellSize-30)/2), pacmany * cellSize + ((cellSize-30)/2));
        lastdirection = DOWN;
      } else if (keyCode == LEFT) {
        image(pacmanleft, pacmanx * cellSize + ((cellSize-30)/2), pacmany * cellSize + ((cellSize-30)/2));
        lastdirection = LEFT;
      } else if (keyCode == RIGHT) {
        image(pacmanright, pacmanx * cellSize + ((cellSize-30)/2), pacmany * cellSize + ((cellSize-30)/2));
        lastdirection = RIGHT;
      }
    } 
    else {
      switch (lastdirection) {
        case UP:
          image(pacmanup, pacmanx * cellSize + ((cellSize-30)/2), pacmany * cellSize + ((cellSize-30)/2));
          break;
        case DOWN:
          image(pacmandown, pacmanx * cellSize + ((cellSize-30)/2), pacmany * cellSize + ((cellSize-30)/2));
          break;
        case LEFT:
          image(pacmanleft, pacmanx * cellSize + ((cellSize-30)/2), pacmany * cellSize + ((cellSize-30)/2));
          break;
        case RIGHT:
          image(pacmanright, pacmanx * cellSize + ((cellSize-30)/2), pacmany * cellSize + ((cellSize-30)/2));
          break;
      }
    }
  }
}
