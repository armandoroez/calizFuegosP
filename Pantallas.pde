//Pantalla 1
void pantalla1() {

  background(0);
  PImage titulo;
  titulo = loadImage ("titulo.jpg");
  imageMode(CENTER);
  image(titulo, width/2, height/2-90);
  pushMatrix();

  rectMode(CENTER);
  fill(255, 255, cuadro);
  rect(width/2, height/2+100, 300, 100);
  textSize(32); 
  fill(255);

  text("COMENZAR", width/2-85, 360); 



  fill(255, cuadro2, cuadro2);
  rect(width/2, height/2+200, 300, 50);
  noStroke();
  fill(255);
  textSize(25);
  text("ORIGEN", width/2-45, 460); 
  popMatrix();
  if (mouseX < 500 && mouseX>200 && mouseY < 400 && mouseY>300) {
    cuadro = 180;
  } else {
    cuadro = 255;
  }

  if (mousePressed && mouseX < 500 && mouseX>200 && mouseY < 400 && mouseY>300) {
    opcion = 1;
  }

  if (mouseX < 500 && mouseX>200 && mouseY < 480 && mouseY>420) {
    cuadro2 = 180;
  } else {
    cuadro2 = 240;
  }

  if (mousePressed && mouseX < 500 && mouseX>200 && mouseY < 480 && mouseY>420) {
    opcion = 2;
  }
}


//Pantalla 2
void fuegosPerrones() {
  int fondo = 0;
  pushMatrix();
  imageMode(CORNER);
  switch(fondo){
  case 0:
  PImage fondo1;
  fondo1 = loadImage ("fondo1.1.png");

  image(fondo1, 0,0);
  break;
  case 1:
  break;
  case 2:
  break;
  }
  popMatrix();

  textSize(15);
  text("Para volver al menu presiona 'M'", 10, 20); 
  if (key == 'm' || key == 'M') {
    opcion = 0;
    keyPressed = false;
  }


  pushMatrix();
   tint(255, 255);
  PImage panda;
  panda = loadImage ("pandasolo.png");
  imageMode(CENTER);
  image(panda, mouseX, height-80);
  popMatrix();



  if (random(1) < 0.08) {
    fireworks.add(new Firework());
  }
  //fill(0, 50);
  //noStroke();
  //rect(0, 0, width+width, height+height);
  //background(255, 20);


  for (int i = fireworks.size()-1; i >= 0; i--) {
    Firework f = fireworks.get(i);
    f.run();
    if (f.done()) {
      fireworks.remove(i);
    }
  }

  pushMatrix();
  PImage canon;
  canon = loadImage ("cañon.png");
  imageMode(CENTER);
  image(canon, mouseX, height-80);
  popMatrix();
}

//Pantalla 3
void pantalla3() {
  PImage info;
  info = loadImage ("info.jpg");
  imageMode(CENTER);
  image(info, width/2, height/2);

  if (key== 'a' || key=='A') {
    opcion=0;
  }
}