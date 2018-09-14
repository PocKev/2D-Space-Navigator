class Sphere {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector up, left, down, right;
  
  float radius;
  float drag = 0.2; //determines time it takes for ball to stop
  float maxSpeed = 9; //determines max speed ball can go
  float incSpeed = 0.4; //determines acceleration of ball
  
  boolean inputting = false;
  
  public Sphere(PVector pos_, float radius_) {
    radius = radius_;
    
    position = pos_;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    up = new PVector(0, 0);
    left = new PVector(0, 0);
    down = new PVector(0, 0);
    right = new PVector(0, 0);
  }
  
  void go() {
    motion();
    display();
  }
  
  void motion() {
    position = position.add(velocity);
    velocity = velocity.add(acceleration);
    
    velocity = velocity.add(up);
    velocity = velocity.add(left);
    velocity = velocity.add(down);
    velocity = velocity.add(right);
    
    velocity.limit(maxSpeed);
    
    if (velocity.x > 0) velocity.x -= drag; //natural friction
    if (velocity.y > 0) velocity.y -= drag; //natural friction
    if (velocity.x < 0) velocity.x += drag; //natural friction
    if (velocity.y < 0) velocity.y += drag; //natural friction
    
    if (velocity.x < 0.1 && velocity.x > -0.1) velocity.x = 0;
    if (velocity.y < 0.1 && velocity.y > -0.1) velocity.y = 0;
    //System.out.println(velocity.x + " " + velocity.y);
  }
  
  void display() {
    ellipseMode(CENTER);
    stroke(1);
    fill(50, 100, 150);
    ellipse(position.x, position.y, radius, radius);
  }
  
  void input(boolean[] keys_) {
    if (keys_[0]) up = new PVector(0, -incSpeed);
    else up = new PVector(0, 0);
    if (keys_[1]) left = new PVector(-incSpeed, 0);
    else left = new PVector(0, 0);
    if (keys_[2]) down = new PVector(0, incSpeed);
    else down = new PVector(0, 0);
    if (keys_[3]) right = new PVector(incSpeed, 0);
    else right = new PVector(0, 0);
  }

}
