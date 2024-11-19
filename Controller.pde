class Controller {
  Controller(Capture _c, OpenCV _cv, AudioIn _mic, Amplitude _amp) {
    frame = _c;
    frame.start();
    
    cv = _cv;
    cv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
    
    mic = _mic;
    mic.start();
    
    amp = _amp;
    amp.input(mic);
  }
  
  void update() {
    if(frame.available()) {
      frame.read();
      cv.loadImage(frame);
      cv.flip(1);
      faces = cv.detect();
    }
    if(faces.length > 0) {
      x = faces[0].x + faces[0].width / 2;
      y = faces[0].y + faces[0].height / 2;
    }
    
    float vol = amp.analyze();
    fire = vol > ampTrsh ? true : false;
  }
  
  Capture frame;
  OpenCV cv;
  Rectangle faces[];
  AudioIn mic;
  Amplitude amp;
  boolean fire = false;
  
  int x = 0;
  int y = 0;
  float ampTrsh = 0.2f;
}
