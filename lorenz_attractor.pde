// An exploration of the Lorenz Attractor, implemented in Processing.
// http://paulbourke.net/fractals/lorenz/
// Yong Bakos

float x0 = 0.1;
float y0 = 0;
float z0 = 0;
float x1, y1, z1;
float h = 0.01;
float a = 10.0;
float b = 28.0;
float c = 8.0 / 3.0;

final int ZOOM = -10000;
final int SCALE = 100;
final int SPHERE_SIZE = 10;
final int SPHERE_DETAIL = 8;

final color darkGrey = color(33);
final color mint = color(200, 255, 200);

void setup() {
  size(displayWidth, displayHeight / 2, P3D);
  background(darkGrey);
  noStroke();
}

void draw() {
  translate(displayWidth / 2, displayHeight / 2, ZOOM);
  x1 = x0 + h * a * (y0 - x0);
  y1 = y0 + h * (x0 * (b - z0) - y0);
  z1 = z0 + h * (x0 * y0 - c * z0);
  x0 = x1;
  y0 = y1;
  z0 = z1;
  fill(mint);
  pushMatrix();
  translate(x0 * SCALE, y0 * SCALE, z0 * SCALE);
  sphereDetail(SPHERE_DETAIL);
  sphere(SPHERE_SIZE);
  popMatrix();
  // println("x0:" + x0 + " y0:" + y0 + " z0:" + z0);
}