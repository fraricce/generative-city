void setup()
{
  size(1024, 768);
  smooth();
  colorMode(RGB, 1.0);
  noLoop();
}

void draw()
{
  background(#AFD1EC);
  //drawBuilding(0, 130, 50, 800, false, 10, color(240,210,0));
  //drawBuilding(50, 120, 200, 800, true, 10, color(221, 153, 94));
  
  //drawBuilding(250, 230, 50, 800, false, 10, color(240,210,0));
  //drawBuilding(300, 220, 200, 800, true, 10, color(221, 153, 94));
  drawBuilding3D(300, 220, 200, 800, 80, 10, color(221, 153, 94), color(240,210,0));

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
