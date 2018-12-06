

class Particle {
  PVector posicion; 
  PVector velocidad;
  PVector aceleracion;
  float duracion;

  boolean seed = false;

  float hu;

  Particle(float x, float y, float h) { //Particulas de la linea que sube
    hu = h;

    aceleracion = new PVector(0, 0);
    velocidad = new PVector(0, random(-12, -5));
    posicion =  new PVector(x, y);
    seed = true;
    duracion = 255.0; 
  }

  Particle(PVector l, float h) { //Particulas del estallido
    hu = h;
    aceleracion = new PVector(0, 0);
    velocidad = PVector.random2D();
    velocidad.mult(random(4, 8));
    posicion = l.copy();
    duracion = 255.0;
  }

  void applyForce(PVector force) {
    aceleracion.add(force);
  }

  void run() {
    update();
    display();
  }

  boolean explode() {
    if (seed && velocidad.y > 0) {
      duracion = 0;
      return true;
    }
    return false;
  }

  // Method to update posicion
  void update() {

    velocidad.add(aceleracion);
    posicion.add(velocidad);
    if (!seed) {
      duracion -= 5.0;
      velocidad.mult(0.95);
    }
    aceleracion.mult(0);
  }

  // Method to display
  void display() {
    stroke(hu, 255, 255, duracion);
    if (seed) {
      strokeWeight(10);
    } else {
      strokeWeight(7);
    }
    fill(hu, 255,255,duracion);
    ellipse(posicion.x, posicion.y,1,1);
    
  }

  
  boolean isDead() {
    if (duracion < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}