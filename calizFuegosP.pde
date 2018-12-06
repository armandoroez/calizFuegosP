
ArrayList<Firework> fireworks;
int opcion = 0;
PVector gravity = new PVector(0, 0.15);
   int cuadro = 240;
   int cuadro2 = 245;
void setup(){
size(700,500);
  fireworks = new ArrayList<Firework>();
  colorMode(HSB);
  background(100);
}

void draw(){
  
/*if (keyPressed = '1')
{
opcion =
}*/



  
switch(opcion){
case 0:
pantalla1();
break;

case 1:
fuegosPerrones();
break;

case 2:
pantalla3();
break;
}
  

  
 
  
}