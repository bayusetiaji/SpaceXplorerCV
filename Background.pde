 class Background {
  Background() {
    sprite = loadImage("background.jpg");
    x = width / 2;
    y1 = -sprite.height / 2 + height;
    y2 = y1 - sprite.height;
  }
  
  void update()
  {
    y1 += 2;
    y2 += 2;
    
    if(y1 >= height + sprite.height / 2)
      y1 = y2 - sprite.height;
    if(y2 >= height + sprite.height / 2)
      y2 = y1 - sprite.height;
  }
  
  void show() {
    image(sprite, x, y1);
    image(sprite, x, y2);
  }
  
  PImage sprite;
  float x;
  float y1;
  float y2;
}
