// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class Firework {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  Particle firework;
  float hue;

  Firework() {
    hue = random(255); //cambio de color
    firework = new Particle(mouseX, height-50, hue); //posición inicial
    particles = new ArrayList<Particle>();   // Initialize the arraylist
  }

  boolean done() {
    if (firework == null && particles.isEmpty()) { ///?????
      return true;
    } else {
      return false;
    }
  }

  void run() {
    if (firework != null) {
      fill(hue, 255, 255);
      //firework.applyForce(gravity);
      firework.actualizacion();
      firework.display();

      if (firework.explotar()) { //Numero de particulas en explosion
        for (int i = 0; i < 50; i++) {
          particles.add(new Particle(firework.posicion, hue));
        }
        firework = null; //despues de explotar las particulas se deshechan
      }
    }

    for (int i = particles.size()-1; i >= 0; i--) {  //estallido
      Particle p = particles.get(i);
      // p.applyForce(gravity);
      p.run();
      if (p.quitar()) {                              //remover
        particles.remove(i);
      }
    }
  }


  // A method to test if the particle system still has particles
  /*boolean dead() {
   if (particles.isEmpty()) {
   return true;
   } else {
   return false;
   }
   }*/
}