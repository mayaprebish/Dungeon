GameState gameState;

int sWidth = 1280;
int sHeight = 768;

// Represents the enemies currently onscreen
ArrayList<Character> enemies = new ArrayList<Character>();

PImage dungeonBG1;
PImage playerSprite;

PImage playerIdleSS;
PImage[] playerIdle = new PImage[3];

PImage playerWalkRSS;
PImage[] playerWalkR = new PImage[4];

PImage playerWalkLSS;
PImage[] playerWalkL = new PImage[4];

PImage playerWalkUSS;
PImage[] playerWalkU = new PImage[4];

PImage playerWalkDSS;
PImage[] playerWalkD = new PImage[4];

int PID = 3;
int PWD = 4;

Player player;

void setup() {
  // Game setup
  size(1280, 768);
  background(0, 0, 0);
  imageMode(CENTER);
  gameState = GameState.INTRO;  
  
  // Load Player sprites
  dungeonBG1 = loadImage("DungeonBackground.png");
  playerSprite = loadImage("PlayerSprite.png");
  playerIdleSS = loadImage("Idle.png");
  playerWalkRSS = loadImage("WalkR.png");
  playerWalkLSS = loadImage("WalkL.png");
  playerWalkUSS = loadImage("WalkU.png");
  playerWalkDSS = loadImage("WalkD.png");
  
  int PIW = playerIdleSS.width/PID;
  int PIH = playerIdleSS.height;
  for (int i = 0; i < playerIdle.length; i++) {
    playerIdle[i] = playerIdleSS.get(i%PID*PIW, i/PIH, PIW, PIH);
  }
  
  int PWW = playerWalkRSS.width/PWD;
  int PWH = playerWalkRSS.height;
  for (int i = 0; i < playerWalkR.length; i++) {
    playerWalkR[i] = playerWalkRSS.get(i%PWD*PWW, i/PWH, PWW, PWH);
  }
  
  for (int i = 0; i < playerWalkL.length; i++) {
    playerWalkL[i] = playerWalkLSS.get(i%PWD*PWW, i/PWH, PWW, PWH);
  }
  
  for (int i = 0; i < playerWalkU.length; i++) {
    playerWalkU[i] = playerWalkUSS.get(i%PWD*PWW, i/PWH, PWW, PWH);
  }
  
  for (int i = 0; i < playerWalkD.length; i++) {
    playerWalkD[i] = playerWalkDSS.get(i%PWD*PWW, i/PWH, PWW, PWH);
  }
  
  // Create Player
  player = new Player(playerSprite, 128, 5, 100, 200, 200);
}

// Handle Mouse actions
void mouseClicked() {
  switch(gameState) {
    case INTRO:
      
      break;
    case GAMESTART:
      // Attack
      
      // Block
  
      break;
    case GAMEOVER:
      // Try Again
      // Main Menu
      break;
  }
}

// Handle Key Pressed
void keyPressed() {
  switch(gameState) {
    case INTRO:
      if (key == CODED && !player.isColliding()) {
        switch(keyCode) {
          case UP:
            player.move(Direction.U, true);
            break;
          case DOWN:
            player.move(Direction.D, true);
            break;
          case LEFT:
            player.move(Direction.L, true);
            break;
          case RIGHT:
            player.move(Direction.R, true);
            break;
        }
      }
      break;
    case GAMESTART:
      break;
    case GAMEOVER:
      break;
  }
}

// Handle Key Released
void keyReleased() {
  switch(gameState) {
    case INTRO:
      if (key == CODED) {
        switch(keyCode) {
          case UP:
            player.move(Direction.U, false);
            break;
          case DOWN:
            player.move(Direction.D, false);
            break;
          case LEFT:
            player.move(Direction.L, false);
            break;
          case RIGHT:
            player.move(Direction.R, false);
            break;
          case SHIFT:
            
        }
      }
      break;
    case GAMESTART:
      break;
     case GAMEOVER:
       break;
  }
}

void draw() {
  background(dungeonBG1);
  
  // Draw animated Player
  if (player.isRight()) {
    player.right(); 
  } 
  else if (player.isLeft()) {
    player.left();
  }
  else if (player.isUp()) {
    player.up();
  }
  else if (player.isDown()) {
    player.down();
  }
  else {
    player.idle();
  }
}

/* SOUND STUFF:
  import processing.sound.*;
  SoundFile file;
  
  file = new SoundFile(this, "Intro Screen.mp3");
  file.play();
*/
