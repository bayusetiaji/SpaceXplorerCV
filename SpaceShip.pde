class SpaceShip {
  SpaceShip() {
    texture = loadImage("spaceship.png");
    textureW = texture.width;
    textureH = texture.height;
  }
  
  void update() {
    float vx = (dx - x) * speed;
    float vy = (dy - y) * speed;
    
    x += vx;
    y += vy;
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    image(texture, 0, 0);
    popMatrix();
  }
  
  public void reset() {
    
  }
  
  public void moveTo(int _dx, int _dy) {
    dx = _dx;
    dy = _dy;
  }
  
  int x = width / 2;
  int y = height - 200;
  int dx = x;
  int dy = y;
  int r = 0;
  int sheild = 3;
  int fuel = 42;
  boolean life = true;
  float speed = 0.1;
  
  PImage texture;
  int textureW;
  int textureH;
}
