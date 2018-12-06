

class Particle {
  PVector posicion; 
  PVector velocidad;
  PVector aceleracion;
  float duracion;

  //boolean seed = false;

  float hue;

  Particle(float x, float y, float h) { //Particulas de la linea que sube
    hue = h;

    aceleracion = new PVector(0, 0); //Siempre comienza en 0s
    velocidad = new PVector(0, random(-12, -8)); //Velocidad hacia arriba
    posicion =  new PVector(x, y);
    //seed = true;
    duracion = 255.0;
  }

  Particle(PVector l, float h) { //Particulas del estallido
    hue = h;
    aceleracion = new PVector(0, 0);
    velocidad = new PVector (random(-1, 1), random(-1, 1)); // la velocidad o direccion con la que salta hacia los lados
    velocidad.mult(4); // produce la expanción en la explosión
    posicion = l.copy(); 
    duracion = 255.0;
  }

  /*  void applyForce(PVector force) {
   aceleracion.add(force);
   }*/

  void run() {
    actualizacion();
    display();
  }

  boolean explotar() {
    if (/*seed && */velocidad.y > 0) { //Cuando y llega totalmente a cero, explota
      duracion = 0; // baja a 0 su opacidad
      return true;
    }
    return false;
  }

  // Method to actualizacion posicion
  void actualizacion() {

    velocidad.add(gravity);
    posicion.add(velocidad);
    duracion-=5.0;
    /* if (!seed) { //seed = semilla, independiza la primera línea de círculos para cambiar color y alpha
     duracion -= 5.0; //establece el rango del alpha
     velocidad.mult(0.95);
     }*/
    //aceleracion.mult(0);
  }

  // Method to display
  void display() {
    stroke(hue, 255, 255, duracion);
    //if (seed) {
    // strokeWeight(10);
    //} else {
    strokeWeight(7);
    //}
    fill(hue, 255, 255, duracion);
    ellipse(posicion.x, posicion.y, 0.5, 0.5);
  }


  boolean quitar() {
    if (duracion < 0.0) { //Cuando el alpha llega a cero se eliminan las particulas
      return true;
    } else {
      return false;
    }
  }
}