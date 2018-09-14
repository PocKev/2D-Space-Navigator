Sphere ball;
boolean[] keys;

void setup() {
  size(800, 600);
  frameRate(30);
  
  ball = new Sphere(new PVector(width/2, height/2), 25); //constructor: (PVector position, float radius)
  keys = new boolean[4];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
}
void draw() {
  background(200);
  //ellipse(ball.position.x, ball.position.y, 3, 3);
  ball.input(keys);
  ball.go();
  
  //System.out.println(ball.velocity.x + " " + ball.velocity.y);
}

void keyPressed() {
  if (key=='w')
    keys[0] = true;
  if (key=='a')
    keys[1] = true;
  if (key=='s')
    keys[2] = true;
  if (key=='d')
    keys[3] = true;
}

void keyReleased() {
  if (key=='w')
    keys[0] = false;
  if (key=='a')
    keys[1] = false;
  if (key=='s')
    keys[2] = false;
  if (key=='d')
    keys[3] = false;
}
