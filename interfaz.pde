class Interfaz {
  float tiempoInicial; //Tiempo inicial en segundos
  float tiempoRestante; //Tiempo restante en segundos
  float barraAnchoInicial; //Ancho inicial de la barra
  float barraAncho; //Ancho actual de la barra
  String text_vidas;
  int num_vidas;
  int cant_items;
  int cant_enem;
  //Vector posiciones validas para generar
  ArrayList<PVector> coordenadasValidas = new ArrayList<PVector>();
  Interfaz() {
    tiempoInicial = 50; //Tiempo inicial en segundos
    tiempoRestante = tiempoInicial; //Tiempo restante en segundos
    barraAnchoInicial = 400; //Ancho inicial de la barra
    text_vidas = "Vidas: ";
    num_vidas=5;
  }
  void dibujar_Barra_T() {
    barraAncho = barraAnchoInicial; //Ancho actual de la barra
    push();
    //Tiene que estar en corner porque sino se achican los dos lados
    rectMode(CORNER);
    //Actualizar el ancho de la barra
    barraAncho = map(tiempoRestante, 0, tiempoInicial, 0, barraAnchoInicial);
    //Dibujar la barra
    fill(255, 0, 200);
    rect(width/3, height/22, barraAncho, 20);
    pop();
    //Actualizar el tiempo restante
    if (tiempoRestante >0) {
      tiempoRestante -= 1 / frameRate;
    }
  }
  //Dibujar
  void dibujar_vidas() {
    textSize(30);
    fill(255, 0, 0);
    if (num_vidas>0 && tiempoRestante>0) {
      text(text_vidas+num_vidas, width/25, height/15);
    }
    //Perdiste por vidas o tiempo
    else if (num_vidas<1 || tiempoRestante<=0) {
      text_vidas ="perdiste";
      text(text_vidas, width/25, height/15);
    }
  }

  //Crear mapa de colisiones
  void crearMapaDeColisiones() {
    for (int x = 0; x < mascara.width; x++) {
      for (int y = 0; y < mascara.height; y++) {
        int index = x + y * mascara.width;
        // Comprueba si el píxel es negro (u otro color deseado)
        if (mascara.pixels[index] == color(0)) {
          coordenadasValidas.add(new PVector(x, y));
        }
      }
    }
  }

  void generarItem() {
    int tam=20;
    int offset =40; //Ajusta el offset según tus necesidades
    if (coordenadasValidas.size() > 0) {
      //Elige una coordenada aleatoria de las coordenadas válidas
      int indiceAleatorio = int(random(coordenadasValidas.size()));
      PVector coordenada = coordenadasValidas.get(indiceAleatorio);

      //Verifica si está cerca del borde sumando y restando el tamaño del item
      boolean estaCercaDelBorde = coordenada.x <= offset || coordenada.x >= width - offset ||
        coordenada.y <= offset || coordenada.y >= height - offset;
      // Verifica si la distancia entre la nave y el item es positiva para no dibujarse detras de la nave
      if (!estaCercaDelBorde && dist(nave.x, nave.y, coordenada.x, coordenada.y) >= 10) {
        //Crea un objeto en la coordenada seleccionada
        item = new Item(coordenada.x, coordenada.y, tam, tam, "Item");
        //Sumar uno a la cantidad actual de items
        cant_items+=1;
      }
    }
  }

  void borrarItem() {
    //Borrar el item
    mundo.remove(item.Item);
    //Restar uno a la cantidad actual de items en pantalla
    cant_items-=1;
  }

  //Generar enemigo
  void generarEnem() {
    int tam=100;
    int offset =tam; //Ajustar el offset para evitar que los enemigos se generen en los bordes
    if (coordenadasValidas.size() > 0) {
      //Elige una coordenada aleatoria de las coordenadas válidas
      int indiceAleatorio = int(random(coordenadasValidas.size()));
      PVector coordenada = coordenadasValidas.get(indiceAleatorio);

      //Verifica si está cerca del borde sumando y restando el tamaño del item
      boolean estaCercaDelBorde = coordenada.x <= offset || coordenada.x >= width - offset ||
        coordenada.y <= offset || coordenada.y >= height - offset;
      //Verifica si la distancia entre la nave y el item es positiva para no dibujarse detras de la nave
      if (!estaCercaDelBorde && dist(nave.x, nave.y, coordenada.x, coordenada.y) >= 50) {
        //Crea un enemigo
        enemigo = new Enemigo(coordenada.x, coordenada.y, tam, tam, "Enemigo");
        cant_enem+=1;
      }
    }
  }

  void borrarEnem() {
    //Borrar el item
    mundo.remove(enemigo.enemigo);
    //Restar uno a la cantidad actual de items en pantalla
    cant_enem-=1;
  }

  //Dibujar obstaculos
  void dibujar_obstaculos() {
    //Obstaculo1
    //Constructor:posX,posY,tamX,tamY,nombre
    obstaculo = new Obstaculo(260, 270, 75, 75, "obstaculo1");
    obstaculo = new Obstaculo(570, 690, 75, 75, "obstaculo1");
    obstaculo = new Obstaculo(160, 450, 75, 75, "obstaculo1");
    obstaculo = new Obstaculo(860, 690, 75, 75, "obstaculo1");
    obstaculo = new Obstaculo(820, 270, 75, 75, "obstaculo1");
  }
}
