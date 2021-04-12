public enum GameState {
  INTRO,
  GAMESTART,
  GAMEOVER
}

public enum Direction {
  U,
  D,
  L,
  R
}

public class Screen {
  Direction[] doors;
  PImage bgImg;
  
  Screen(Direction[] doors, PImage bgImg) {
    this.doors = doors;
    this.bgImg = bgImg;
  }
  
  void drawBackground() {
    background(bgImg);
  }
  
  
}

/*
A Character is a creature with its own sprite and sprite size, a speed value, a health value, an x and a y position.
*/
public class Character {
  PImage sprite;
  //PImage[] idle;
  //PImage[] walkL;
  //PImage[] walkR;
  //PImage[] walkU;
  //PImage[] walkD;
  
  float size;
  float speed;
  int health;
  
  int xPos;
  int yPos;
  
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  boolean run;
  
  Character(PImage sprite, float size, float speed, int health, int x, int y) {
    this.sprite = sprite;
    this.size = size;
    this.speed = speed;
    this.health = health;
    this.xPos = x;
    this.yPos = y;

  }
  
  boolean isColliding() {
    
    return false;
  }
  
  boolean isRunning() {
    return this.run; 
  }
  
  boolean isIdle() {
    return 
      !this.left && 
      !this.right &&
      !this.up &&
      !this.down;
  }
  
  boolean isLeft() {
    return this.left;
  }
  
  boolean isRight() {
    return this.right;
  }
  
  boolean isUp() {
    return this.up;
  }
  
  boolean isDown() {
    return this.down;
  }
  
  
  
  void walk() {
    if (this.left) {
      if (this.run) {
        this.xPos -= this.speed * 2;
      } else {
        this.xPos -= this.speed;
      }
    }
    if (this.right) {
      if (this.run) {
        this.xPos += this.speed * 2;
      } else {
        this.xPos += this.speed;
      }
    }
    if (this.up) {
      if (this.run) {
        this.yPos -= this.speed * 2;
      } else {
        this.yPos -= this.speed;
      }
    }
    if (this.down) {
      if (this.run) {
        this.yPos += this.speed * 2;
      } else {
        this.yPos += this.speed;
      }
    }
  }
  
  void move(Direction d, boolean move) {
    switch(d) {
      case L:
        if (move) {
          this.left = true;
        } else {
          this.left = false;
        }
        break;
      case R:
        if (move) {
          this.right = true;
        } else {
          this.right = false;
        }
        break;
      case U:
        if (move) {
          this.up = true;
        } else {
          this.up = false;
        }
        break;
      case D:
        if (move) {
          this.down = true;
        } else {
          this.down = false;
        }
        break;
    }
  }
  
  void run(boolean run) {
    this.run = run;
  }
  
  void hit(int amt) {
    this.health -= amt; 
  }
  
  void heal(int amt) {
    this.health += amt; 
  }
  
}

public class Player extends Character {
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  boolean run;
  
  PImage[] idle;
  PImage[] walkL;
  PImage[] walkR;
  PImage[] walkU;
  PImage[] walkD;
  
  Player(PImage sprite, float size, float speed, int health, int x, int y) {
    super(sprite, size, speed, health, x, y);
        
    this.idle = playerIdle;
    this.walkR = playerWalkR;
    this.walkL = playerWalkL;
    this.walkU = playerWalkU;
    this.walkD = playerWalkD;
  }
  
  void drawCharacter() {
    image(this.sprite, this.xPos, this.yPos, this.size, this.size);
  }
  
  void idle() {
    super.walk();
    image(this.idle[frameCount/16%this.idle.length], this.xPos, this.yPos, this.size, this.size);
  }
  
  void right() {
    super.walk();
    image(this.walkR[frameCount/16%this.walkR.length], this.xPos, this.yPos, this.size, this.size);
  }
  
  void left() {
    super.walk();
    image(this.walkL[frameCount/16%this.walkL.length], this.xPos, this.yPos, this.size, this.size);
  }
  
  void up() {
    super.walk();
    image(this.walkU[frameCount/16%this.walkU.length], this.xPos, this.yPos, this.size, this.size);
  }
  
  void down() {
    super.walk();
    image(this.walkD[frameCount/16%this.walkD.length], this.xPos, this.yPos, this.size, this.size);
  }

}

public class Enemy extends Character {
  PImage sprite;
  
  float size;
  float speed;
  int health;
  
  int xPos;
  int yPos;
  
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  boolean run;
  
  Enemy(PImage sprite, float size, float speed, int health, int x, int y) {
    super(sprite, size, speed, health, x, y);
  }
}
