PGraphics canvas;
int tiles = 3;
Shape[][] shapes;
float alphaRect = 255;
void setup() {
  size(1080, 1080, P2D);

  background(255);
  shapeMode(CENTER);
  smooth(8);
  canvas = createGraphics(1080, 1080, P2D);

  canvas.shapeMode(CENTER);
  canvas.smooth(8);
  canvas.beginDraw();
  canvas.background(255);
  canvas.fill(255);
  canvas.rect(0, 0, canvas.width, canvas.height);
  canvas.endDraw();

  shapes = new Shape[tiles][tiles];

  for (int i = 0; i < tiles; i++) {
    for (int j = 0; j < tiles; j++) {
      float x = canvas.width / tiles * (i + 0.5);
      float y = canvas.height / tiles * (j + 0.5);
      PVector origin = new PVector(x, y);
      shapes[i][j] = new Shape(origin);
    }
  }
}

void draw() {

  canvas.beginDraw();
  canvas.fill(255, alphaRect);
  canvas.rect(0, 0, canvas.width, canvas.height);
  for (int i = 0; i < tiles; i++) {
    for (int j = 0; j < tiles; j++) {
      shapes[i][j].show();
    }
  }
  canvas.endDraw();

  image(canvas, 0, 0, width, height);
  surface.setTitle("" + frameRate);
  alphaRect = constrain(alphaRect - 30, 60, 255);
  //saveFrame("frames/####.png");
  //if(frameCount == 900){
  //  exit();  
  //}
}
