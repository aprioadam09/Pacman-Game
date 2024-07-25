//total coin = 272;

class Coin {
  float x, y;
  private boolean active;
  float coinSize = 7;

  Coin(float x, float y) {
    this.x = x;
    this.y = y;
    this.active = true;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  public boolean isActive() {
    return active;
  }

  public void deactivate() {
    active = false;
  }

  void display() {
    if (active) {
      fill(255,255,0); 
      ellipse(x * cellSize + cellSize / 2, y * cellSize + cellSize / 2, coinSize, coinSize);
    }
  }

  boolean PacmanGettheCoin(float pacmanx, float pacmany) {
    return active && int(pacmanx) == int(x) && int(pacmany) == int(y);
  }
}
