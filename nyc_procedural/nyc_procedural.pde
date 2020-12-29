int loop = 0;
boolean infinite = true;
int density = 2;
int layerDensity = 3;

void setup()
{
  size(1024, 768);
  smooth();
  colorMode(RGB, 1.0);
  background(#AFD1EC);
}

void draw()
{
  if (loop > density && infinite == false) {
    noLoop();
    print("noLoop");
  } else {
    drawLayer();
  }
  
  loop = loop + 1;
}

void drawLayer() {
  int x = 0, w = 0;
  for (int i=0; i<layerDensity; i++) {
    x += w + int(random(200));
    w = int(random(300));
    int y = int(random(500))+20;
    int poww = w - ((w/3) * 2);
    int powh = w / 20;
    drawBuilding3D(x, y, w, 900, poww, powh, color(221, 153, 94), color(240,210,0));
  }
}


void drawBuilding(int x, int y, int width, int height, boolean direction, int angle, color foreColor)
{
  stroke(foreColor);
  for (int i=y; i < height; i += 5) {
    strokeWeight(1 + random(3));
    int yDest = direction ? i + angle : i - angle;
    line(x, i, x + width, yDest);
  }
}

void drawBuilding3D(int x, int y, int width, int height, int powW, int powH, color foreColor, color shadowColor)
{
  for (int i=y; i < height; i += 5) {
    strokeWeight(1 + random(2));
    stroke(shadowColor);
    line(x, i, x + powW, i - powH);
    strokeWeight(1 + random(2));
    stroke(foreColor);
    line(x + powW, i - powH, x + width - (powH), i);
  }
}
