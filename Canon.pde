class Canon {
  Canon() {
    sprite = loadImage("missile.png");
    missiles = new ArrayList<Missile>();
  }
  
  void fire(int _x, int _y) {
    missiles.add(new Missile(_x, _y));
  }
  
  void update() {
    for(int i = missiles.size() - 1; i >= 0; --i) {
      Missile m = missiles.get(i);
      m.y -= 20;
      
      if(m.y <= -6 || !m.life)
        missiles.remove(i);
      else      
        missiles.set(i, m);
    }
  }
  
  void show() {
    for(Missile m:missiles) {
      image(sprite, m.x, m.y);
    }
  }
  
  ArrayList<Missile> missiles;
  PImage sprite;
}
