class Obstaculo {
  FBox obstaculo;
  // Constructor
  Obstaculo(float posX, float posY, float tamX, float tamY, String nombre) {
    obstaculo = new FBox(tamX, tamY);
    obstaculo.setPosition(posX, posY);
    obstaculo.setName(nombre);
    obstaculo.setFill(255, 0, 0);
    obstaculo.setStatic(true);
    //Rebote
    obstaculo.setRestitution(0.2);
    obstaculo.setGrabbable(false);
    obstaculo.attachImage(roca);
    mundo.add(obstaculo);
  }
}
