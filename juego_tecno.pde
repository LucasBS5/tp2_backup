import fisica.*;
import processing.sound.*;

//To Do list
//Trackeo de manos
//Arreglar tamaño caja de colisiones
//Hacer un impulso para alejar del enemigo u obstaculo?
//Arreglar la forma en la que se generan los items que cada uno tenga un nombre
//Hacer circulo de interfaz ?
//Dar feedback en las colisiones
//Agregar fuego a la nave

PImage conejo_motosierra;
PImage nave_s_fuego;
PImage fondo1;
PImage fuego;

//Poligonos
PImage poly1;
PImage poly2;
PImage poly3;

//Mapa colisiones
PImage mascara; //Imagen mascara

//Tiempo
float tiempoActual;
float tiempoUltimaGeneracion;
float tiempoEntreGeneraciones = 05.0; // Tiempo en segundos entre generaciones

//Crear mundo
FWorld mundo;
//Crear nave
Nave nave;
//Crear obstaculo
Obstaculo obstaculo;

//Variable de sonido
SoundFile musicaFondo;
SoundFile winlose;
SoundFile choqueNave;
SoundFile bebida;
SoundFile zombies;
SoundFile aplausos;

//Crear item
Item item;
//Crear enemigo
Enemigo enemigo;
//Crear interfaz
Interfaz interfaz;
//Crear caminos
Camino camino1, camino2, camino3;

//Crear meta
FBox meta;

//Estado
String estado;

void setup() {
  //Inicializar libreria fisica
  Fisica.init(this);
  //inicializar mundo
  mundo=new FWorld();
  //Gravedad del mundo
  mundo.setGravity(0, 0);

  //Bordes del mundo
  mundo.setEdges();
  mundo.left.setDrawable(false);
  mundo.top.setDrawable(false);
  mundo.bottom.setDrawable(false);
  mundo.right.setDrawable(false);
  size(1080, 720);
  fondo1 = loadImage("images/fondo1.png");
  conejo_motosierra = loadImage("images/enemigo_motosierra.png");
  nave_s_fuego = loadImage("images/conejo_nave_s_fuego.png");
  fuego = loadImage("images/fuego_nave.png");
  //Poligonos
  poly1 = loadImage("images/poly1.png");
  poly2 = loadImage("images/poly2.png");
  poly3 = loadImage("images/poly3.png");
  //Imagen mapa colision
  mascara = loadImage("images/mapa_colision.jpg");
  mascara.loadPixels();

  //Objetos
  nave = new Nave();
  interfaz =new Interfaz();
  interfaz.dibujar_obstaculos();

  //Caminos
  camino1=new Camino(1);
  camino2=new Camino(2);
  camino3=new Camino(3);

  //Sonidos
  musicaFondo = new SoundFile(this, "sonido/musica fondo1.wav");
  choqueNave = new SoundFile(this, "sonido/choque2.wav");
  zombies = new SoundFile(this, "sonido/zombie1.wav");
  bebida = new SoundFile(this, "sonido/bebida-combustible2.wav");
  winlose = new SoundFile(this, "sonido/musicawl.wav");
  aplausos = new SoundFile(this, "sonido/aplausos.wav");

  //Mapa de colisiones
  interfaz.crearMapaDeColisiones();
  //Estados empieza en inicio
  estado="inicio";
  //Meta
  meta = new FBox(150, 150);
  meta.setStatic(true);
  meta.setSensor(true);
  meta.setPosition(135, 0);
  meta.setDrawable(false);
  meta.setGrabbable(false);
  meta.setName("meta");
  mundo.add(meta);
}

void draw() {
  //Estado incio
  if (estado=="inicio") {
    //cuando se detecta una mano de este estado pasa a jugando
    /*if(){
     estado="jugando";
     }*/
  }

  //Estado jugando
  if (estado=="jugando") {
    image(fondo1, 0, 0);
    mundo.step();
    mundo.draw();
    //nave
    nave.moverNave();
    //Generar enemigos
    //Aca se modifica la cantidad de enemigos que se genera
    if (interfaz.cant_enem<=0) {
      interfaz.generarEnem();
    }

    push();
    tiempoActual = millis() / 1000.0; // Tiempo actual en segundos
    // Comprueba si ha pasado suficiente tiempo desde la última generación
    boolean  pasotiempo_generacion=tiempoActual - tiempoUltimaGeneracion >= tiempoEntreGeneraciones ;
    if (pasotiempo_generacion && interfaz.cant_items <1) {
      interfaz.generarItem();
      tiempoUltimaGeneracion = tiempoActual; // Actualiza el tiempo de la última generación
    }
    interfaz.dibujar_Barra_T();
    interfaz.dibujar_vidas();
    pop();

    //si se acaban las vidas o el tiempo pasa al estado perdiste
    if (interfaz.num_vidas<=0 || interfaz.tiempoRestante<0) {
      estado="perdiste";
      musicaFondo.stop();
      winlose.amp(0.5);
      winlose.loop();
    }
    // Fin del codigo del estado jugando
  }

  //Estado ganaste
  if (estado=="ganaste") {
    //Cuando pasa x cantidad de tiempo de este estado pasa a inicio
    background(0, 250, 0);
    estado="reinicio";
  }
  if (estado=="perdiste") {
    background(250, 0, 0);
    estado="reinicio";
  }
  //Cuando pasa x cantidad de tiempo de este estado pasa a inicio
  if (estado=="reinicio") {
    //interfaz
    interfaz.tiempoInicial=50;
    interfaz.tiempoRestante = interfaz.tiempoInicial; // Tiempo restante en segundos
    interfaz.barraAnchoInicial = 400;
    interfaz.num_vidas=5;
    interfaz.text_vidas ="Vidas: ";

    //Nave
    //Quizas resetear el angulo?
    nave.nave.setVelocity(0, 0);
    nave.nave.setPosition(100, height-100);

    //Restear items y enemigos
    interfaz.borrarItem();
    interfaz.borrarEnem();

    //Volver a la pantalla de inicio
    background(250);
    estado="inicio";
  }
}

//Metodos para saber si se arrastró o no el mouse
void mousePressed() {
  //nave.mousePressed(); // Llamar al método para manejar el mouse cuando se presiona
  if (estado=="inicio") {
    estado = "jugando";
    //Musica de fondo en loop
    musicaFondo.amp(0.5);
    musicaFondo.loop();
    winlose.stop();
  }
}

void mouseReleased() {
  //nave.mouseReleased(); // Llamar al método para manejar el mouse cuando se suelta
}

//Colisones
void contactStarted(FContact contacto) {
  FBody body1 = contacto.getBody1();
  FBody body2 = contacto.getBody2();
  //Si la colision no es con una pared
  if (body1 != null && body2 != null)
  {
    /*Cuando la nave choca contra un obstaculo y no está invulnerable
     y las vidas son mas que 0*/
    if (body1.getName() == "Nave" && body2.getName() == "obstaculo1"
      &&!nave.estaInvulnerable() && interfaz.num_vidas>0)
    {
      choqueNave.amp(0.3);
      choqueNave.play();
      println("body1: " + body1.getName());
      println("body2: " + body2.getName());
      //Si las vidas son mayores a 0 y la nave no esta invulnerable
      //Perdiste una vida
      interfaz.num_vidas-=1;
      //Activa la invulnerabilidad,el tiempo de espera entre activaciones es el tiempo que dura la invulnerabilidad (5s)
      nave.hacerInvulnerable();
      nave.tiempoEsperaInvulnerabilidad = millis();
      //Cambia el color de nave
      body1.setImageAlpha(90);
    }

    //Cuando colisionas con la meta  y no se termino el tiempo o las vidas pasa a ganaste
    if (body1.getName() == "Nave" && body2.getName() == "meta" && interfaz.num_vidas>0 && interfaz.tiempoRestante>0 ) {
      estado="ganaste";
      musicaFondo.stop();
      winlose.amp(0.5);
      winlose.loop();
      aplausos.amp(0.3);
      aplausos.play();
    }

    //Cuando la nave choca contra un item
    if (body1.getName() == "Nave" && body2.getName() == "Item")
    {
      bebida.amp(0.3);
      bebida.play();
      println("body1: " + body1.getName());
      println("body2: " + body2.getName());

      //Para evitar que se agarren vidas una vez que se acabaron las vidas
      if (interfaz.num_vidas>0 && interfaz.tiempoRestante>0) {
        //Agarraste un item
        println("agarraste un item");
        interfaz.borrarItem();
        //dar tiempo
        interfaz.tiempoRestante+=1;
      }
    }

    /*Cuando la nave choca contra un enemigo y no está invulnerable
     y las vidas son mas que 0*/
    if (body1.getName() == "Nave" && body2.getName() == "Enemigo"
      && !nave.estaInvulnerable() && interfaz.num_vidas>0)
    {
      zombies.amp(0.3);
      zombies.play();
      println("body1: " + body1.getName());
      println("body2: " + body2.getName());
      interfaz.num_vidas-=1;
      //Activa la invulnerabilidad,el tiempo de espera entre activaciones es el tiempo que dura la invulnerabilidad (5s)
      nave.hacerInvulnerable();
      nave.tiempoEsperaInvulnerabilidad = millis();
      //Cambia el color de nave
      body1.setImageAlpha(90);
    }
    if (body2.getName() == "Nave" && body1.getName() == "Enemigo"
      && !nave.estaInvulnerable() && interfaz.num_vidas>0)
    {
      println("body1: " + body1.getName());
      println("body2: " + body2.getName());
      interfaz.num_vidas-=1;
      //Activa la invulnerabilidad,el tiempo de espera entre activaciones es el tiempo que dura la invulnerabilidad (5s)
      nave.hacerInvulnerable();
      nave.tiempoEsperaInvulnerabilidad = millis();
      //Cambia el color de nave
      body2.setImageAlpha(90);
    }
  }
}

//Cuando deja de colisionar
void contactEnded(FContact contacto)
{
  FBody body1 = contacto.getBody1();
  FBody body2 = contacto.getBody2();
  if (body1 != null && body2 != null)
  {
    if (body1.getName() != null && body2.getName() != null)
    {
      body1.setImageAlpha(255);
    }
  }
}
