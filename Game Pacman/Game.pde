import processing.sound.*;

int cols = 25; 
int rows = 23;  
int cellSize = 40; 
boolean gameover = false;
boolean win = false;
PImage Map;
PFont font;

int[][] map = { 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1},
  {1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1},
  {1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
  {1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1},
  {1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1},
  {1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1},
  {1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1},
  {1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1},
  {1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1},
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1},
  {1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1},
  {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1},
  {1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1},
  {1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
};

ArrayList<Coin> coins;
pacman Pacman;
ghost Ghost;
ghost2 Ghost2;

SoundFile backsound;
SoundFile coinsound;
SoundFile victory;
SoundFile gameOver;

void setup (){
  size(1000,920);
  
  backsound = new SoundFile(this, "backsound-cut.MP3");
  backsound.loop();
  backsound.amp(0.5);
  coinsound = new SoundFile(this, "sound-coin.wav");
  coinsound.amp(0.7);
  victory = new SoundFile(this, "victory.WAV");
  gameOver = new SoundFile(this, "game-over.WAV");
  
  Map = loadImage("Map-pacman.png");
  
  coins = new ArrayList<Coin>();
  placeCoins();
  Pacman = new pacman();
  Ghost = new ghost(10,15);
  Ghost2 = new ghost2(15,15);
}

void drawMap() {
  image(Map,0,0);
}

void placeCoins() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (map[i][j] == 0) {
        coins.add(new Coin(j, i));
      }
    }
  }
}

void drawCoins() {
  if (!coins.isEmpty()) {
    for (Coin coin : coins) {
      coin.display();
    }
  }
}

void checkCoinCollision() {
  for (int i = coins.size() - 1; i >= 0; i--) {
    Coin coin = coins.get(i);
    if (coin.PacmanGettheCoin(Pacman.pacmanx, Pacman.pacmany)) {
      coin.deactivate();
      Pacman.score += 1; 
      coinsound.play();
    }
  }
  coins.removeIf(c -> !c.isActive());
}

void draw(){
  if(!gameover && !win){
    //background(255);
    
    drawMap();
    drawCoins();
    
    Pacman.move();
    Pacman.display();
    
    Ghost.move();
    Ghost.display();
    
    Ghost2.move();
    Ghost2.display();
    
    checkCoinCollision();
    
    font = createFont("Hypebuzz",16,true);
    textFont(font);
    fill(255);
    textAlign(LEFT);
    text("Score: " + Pacman.score, 20, 25);
    
    if (Pacman.score == 272){
      win = true;
      victory.play();
      backsound.stop();
    }
    
    if (Pacman.pacmanx == Ghost.ghostx && Pacman.pacmany == Ghost.ghosty) {
       gameover = true; 
       gameOver.play();
       backsound.stop();
     }
   } else if (gameover == true){
     font = createFont("Hypebuzz",72,true);
     textFont(font);
     fill(255);
     textAlign(CENTER);
     text("Game Over", width / 2, height / 2);
   } else if (win == true){
     font = createFont("Hypebuzz",72,true);
     textFont(font);
     fill(255);
     textAlign(CENTER);
     text("You Win!", width / 2, height / 2);
   }
 }
