import processing.sound.*;
import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

SpaceShip spaceship;
Canon canon;
Background background;
Controller controller;

SoundFile bgSound;
SoundFile laserShot;

void setup() {
  size(640, 800);
  controller = new Controller(
    new Capture(this), 
    new OpenCV(this, 640, 480),
    new AudioIn(this),
    new Amplitude(this));
  
  background = new Background();
  spaceship = new SpaceShip();
  canon = new Canon();
  
  bgSound = new SoundFile(this, "cavern.mp3");
  laserShot = new SoundFile(this, "lasershot.wav");
  
  bgSound.loop();
  
  //frameRate(60);
  imageMode(CENTER);
}

void draw() {
  background(0);
  controller.update();
  
  background.update();  
  canon.update();
  spaceship.moveTo(controller.x, spaceship.y);
  spaceship.update();
  
  background.show();
  canon.show();
  spaceship.show();
  
  if(controller.fire) {
    canon.fire(spaceship.x, spaceship.y);
    if(!laserShot.isPlaying())
      laserShot.play();
  }
  
  text(frameRate + " fps", 20, 20);
}
