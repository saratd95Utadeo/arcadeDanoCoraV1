int anchoVentana=500; //en size no identifica esta variable, toca cambiarla manual
int altoVentana=500;
int puntaje=0;
int vidas=3;
String mje;

int tiempoLimite=15000;

color nudePiel = #B3A48D;
color negroCasi = color(30, 28, 34);

//Cuadros
float posCuadro_X=200;
int espacioEntreCuadros= 8;
int columnasCuadros= 2; //columnas
int filasCuadros= 2; // Filas
int espacioCielo= 100; //espacio entre borde sup ventana y 1ra fila de cuadros
float anchoCuadro= 20;//(anchoVentana-(columnasCuadros-2)*espacioEntreCuadros)/columnasCuadros
float altoCuadro= 20;
color brickColors[]= {color(#4C5A56), color(#EAD7C9), color(255,255,0), color(0,255,0), color(0,0,255), color(156,0,255), color(255, 0,0), color(255,183, 0), color(255,255,0), color(0,255,0)};
//color brickColor= color(255, 255, 0); no se q es
ArrayList<Bloque> grupoDeCuadros= new ArrayList<Bloque>();

//Bola
int anchoBola= 16;
float posInicialBolaX=random(anchoVentana);
float posInicialBolaY=altoVentana/2;
color colorBola= color(#000000);
boolean haPerdido= false;
boolean haGanado= false;
Bola Lala= new Bola(posInicialBolaX, posInicialBolaY, anchoBola, colorBola);

//base
int baseX= anchoVentana/2;
int baseY= altoVentana-70;
int alturaBase= 20;
int anchoBase= 70;
color baseColor= color(255, 255, 255);
Bloque base= new Bloque(baseX, baseY, anchoBase, alturaBase, baseColor);

void setup() {
  size(500, 500); //deben coincidir con los dos primeros valores de arriba
  background(255); 
  iniciarCuadros();
}

void draw() {
    background(#F04141); 
    dibujarCuadros();
    if(!haPerdido&&!haGanado) dibujarBola();
    dibujarBase();
    updatePuntaje(false);
    impTxtVidas();
    int tiempoActual = millis();
    if(vidas==0){
    finalPerder();}else if(tiempoActual>tiempoLimite){
      finalPerderPorTiempo();
    };
    
}

//INICIALIZAR CUADROS
void iniciarCuadros() {
  
  //1ra Columna
  for(int i=0; i<3; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=espacioCielo+(altoCuadro+espacioEntreCuadros)*i;
    posCuadro_X=100+(anchoCuadro+espacioEntreCuadros);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  //2da Columna
  for(int i=0; i<5; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=(espacioCielo+(altoCuadro+espacioEntreCuadros)*i)-(altoCuadro+espacioEntreCuadros);
    posCuadro_X=100+anchoCuadro+(espacioEntreCuadros*5);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  //3ra Columna
  for(int i=0; i<6; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=(espacioCielo+(altoCuadro+espacioEntreCuadros)*i)-(altoCuadro+espacioEntreCuadros);
    posCuadro_X=100+anchoCuadro+(espacioEntreCuadros*9);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  //4ta Columna
  for(int i=0; i<7; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=(espacioCielo+(altoCuadro+espacioEntreCuadros)*i)-(altoCuadro+espacioEntreCuadros);
    posCuadro_X=100+anchoCuadro+(espacioEntreCuadros*13);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  //5ta Columna
  for(int i=0; i<7; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=(espacioCielo+(altoCuadro+espacioEntreCuadros)*i);
    posCuadro_X=100+anchoCuadro+(espacioEntreCuadros*17);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  //6ta Columna
  for(int i=0; i<7; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=(espacioCielo+(altoCuadro+espacioEntreCuadros)*i)-(altoCuadro+espacioEntreCuadros);
    posCuadro_X=100+anchoCuadro+(espacioEntreCuadros*21);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  //7ma Columna
  for(int i=0; i<6; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=(espacioCielo+(altoCuadro+espacioEntreCuadros)*i)-(altoCuadro+espacioEntreCuadros);
    posCuadro_X=100+anchoCuadro+(espacioEntreCuadros*25);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  //8va Columna
  for(int i=0; i<5; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=(espacioCielo+(altoCuadro+espacioEntreCuadros)*i)-(altoCuadro+espacioEntreCuadros);
    posCuadro_X=100+anchoCuadro+(espacioEntreCuadros*29);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  //1ra Columna
  for(int i=0; i<3; i++){
    color brickColor=negroCasi;
    float posCuadro_Y=espacioCielo+(altoCuadro+espacioEntreCuadros)*i;
    posCuadro_X=100+(anchoCuadro+espacioEntreCuadros*33);
    grupoDeCuadros.add(new Bloque(posCuadro_X, posCuadro_Y, anchoCuadro, altoCuadro, brickColor));    
  }
  
}

//DIBUJAR LOS CUADROS
void dibujarCuadros() {  
  for(int cantCuadros= grupoDeCuadros.size()-1; cantCuadros>=0; cantCuadros--) {
    Bloque brick=grupoDeCuadros.get(cantCuadros);
    brick.draw();
    if(brick.collidesWith(Lala)) { //si al cuadro es chocado x bola, se elimina
      grupoDeCuadros.remove(brick);
      updatePuntaje(true);
    }
  }
}

//DIBUJAR LA BOLA
void dibujarBola() {
    Lala.draw();
    Lala.actualizarBola();
    if(Lala.verColisionParedBola()) {
      vidas--;
      Lala.move(anchoVentana/2, altoVentana/2);
    }
}


//draw the base and have it move with the mouse
void dibujarBase() {
  base.draw();
  base.posBloque_X=mouseX;
  base.collidesWith(Lala);
}

void mostrarTexto(String mje, int x, int y, boolean txtCentrado) {
  fill(0);
  textSize(32);
    String nombreTxt= mje;
    float posTxt_X= x;
    if (txtCentrado) {
      float anchoTxt= textWidth(nombreTxt);
      posTxt_X= (anchoVentana-anchoTxt)/2;
    } 
    int textY= y;
    text(nombreTxt, posTxt_X, textY);
}

void finalPerderPorTiempo() {
  noStroke();
  fill(#F2F2EB,127); //el 127 es de opacidad, representa 55% de opacidad
  //la opacidad se representa de 0 a 255
  //255 es un 100% de opacidad
  rect(25, (altoVentana/2)-50, anchoVentana-50, 70, 7);
  String mje="¡El tiempo se agota, No Fume!";
    mostrarTexto(mje, 0, (altoVentana/2)-10, true);
    haPerdido=true;
  }
  
void finalPerder() {
  noStroke();
  fill(#F2F2EB,127); //el 127 es de opacidad, representa 55% de opacidad
  //la opacidad se representa de 0 a 255
  //255 es un 100% de opacidad
  rect(25, (altoVentana/2)-50, anchoVentana-50, 70, 7);
  String mje="¡¿Seguirá Fumando?!";
    mostrarTexto(mje, 0, (altoVentana/2)-10, true);
    haPerdido=true;
  }
  
void updatePuntaje(boolean esNuevo) {
  if (esNuevo) puntaje+=50; //cada q la bola toca un cuadro suma 50
  mje="Puntaje:"+puntaje;
  mostrarTexto(mje, 0, altoVentana-450, false);
  //calcula total de puntos posibles y compara con puntaje
  //49 son el total de cuadros que hice
  if(puntaje==49*50) {  // si son iguales muestra letrero, columnasCuadros*filasCuadros*50 
    mostrarTexto("Nunca ganas con el cigarrillo",0,altoVentana/2,true);
    haGanado=true;
  }
}

// ESO NO TIENE UTILIDAD
/** aaaaaaaaaaaaaaa o si?
void checkLives() {
  if(Lala.posBola_Y+Lala.anchoBola==altoVentana) {
    vidas--;
  }
  impTxtVidas();
}**/

void impTxtVidas() {
  String mje;
  mje="Vidas: " + vidas;
  mostrarTexto(mje,((int)(anchoVentana-textWidth(mje))),altoVentana-450,false);
}


/******* BOLA **********/
class Bola {
  float posBola_X;
  float posBola_Y;
  float anchoBola;
  color colorBola;
  float velY= 3.5;
  float velX= 3.5;
  
  //CONSTRUCTOR
  //usar fuera de la clase: 
  //Bola nombreDeLaBola= new Bola(x, y, Width, Color);
  Bola(float x, float y, int Ancho, color Color) {
     posBola_X= x;
     posBola_Y= y;
     anchoBola= Ancho;
     colorBola= Color; 
  }
   //crear la elipse como tal con los datos de la bola
  void draw() {
    noStroke();
    fill(colorBola);
    ellipse(posBola_X, posBola_Y, anchoBola, anchoBola);
  }
  
  
  //desplazar bola segun velocidad;
  void actualizarBola() {
    posBola_X+=velX;
    posBola_Y+=velY;
  }
  void move(int X, int Y) {
    posBola_X = X;
    posBola_Y = Y;
    velY= 4;
    velX= 4;
  }
  
  // bounce bola
  boolean verColisionParedBola() {
    if (posBola_X>anchoVentana-anchoBola/2) {
        velX=-abs(velX); //abs es encontrar el valor absoluto del nro, entonces el nro siempre sera positivo
    } else if (posBola_X<anchoBola/2) {
       velX=abs(velX);
    } if (posBola_Y>altoVentana-anchoBola/2) { 
        velY=-abs(velY);
        return true; 
    } else if (posBola_Y<anchoBola/2) {
        velY= abs(velY);
    }
    return false;
  }
}

/********** BLOQUE **************/
class Bloque {
  float posBloque_X;
  float posBloque_Y;
  float anchoBloque;
  float altoBloque;
  color colorBloque;
  int maxGolpes= 1;
  int golpes=maxGolpes;
  
  //constructor
  Bloque(float x, float y, float Width, float Height, color Color) {
     posBloque_X= x;
     posBloque_Y= y;
     anchoBloque= Width;
     altoBloque= Height;
     colorBloque= Color; 
  }
   //hacer q se muestren los bloques en pantalla
  void draw() {
    noStroke();
    fill(colorBloque);
    rect(posBloque_X, posBloque_Y, anchoBloque, altoBloque);
  }
  
  
  //Ubicar los bloques
  //para centrar en X y Y 
  void move(int X, int Y) {
    posBloque_X=X-anchoBloque/2;
    posBloque_Y=Y-altoBloque/2;
    
    //no dejar que se salga en eje  X
    if (posBloque_X+anchoBloque>anchoVentana) {
      posBloque_X=anchoVentana-anchoBloque;
    }
    else if (posBloque_X<0) {
      posBloque_X=0;
    }
    
    //no dejar que se salga en eje  Y
    if (posBloque_Y+altoBloque>altoVentana) {
      posBloque_Y=altoVentana-anchoBloque;
    }
    else if (posBloque_Y<0) {
      posBloque_Y=0;
    } 
  }
  
  
  //Identificar si algun bloque choca con la bola
 // la bola cambia de velocidad automaticamente
  boolean collidesWith(Bola b) {
    //si bola choca con la parte inferior de un bloque
    if ((b.posBola_X+b.anchoBola/4>posBloque_X && b.posBola_X-b.anchoBola/4<posBloque_X+anchoBloque)
        && (b.posBola_Y-b.anchoBola/2<(posBloque_Y+altoBloque) && b.posBola_Y-anchoBola/2>posBloque_Y)) {
        println("Pego en un bloquee X debajo!!!");
        b.velY=abs(b.velY);
        golpes--;
        return true;
      }
    
    //si bola choca con la parte superior de un bloque
    if ((b.posBola_X+b.anchoBola/4>posBloque_X && b.posBola_X-b.anchoBola/4<posBloque_X+anchoBloque)
      && (b.posBola_Y+b.anchoBola/2<posBloque_Y+altoBloque && b.posBola_Y+b.anchoBola/2>posBloque_Y)) {
        //println("Pego en un bloquee X debajo!!! ");
        b.velY=-abs(b.velY);
        golpes--;
        return true;
      }
      
     //si bola choca con lado izq de un bloque
    else if ((b.posBola_Y+b.anchoBola/4>posBloque_Y && b.posBola_Y-b.anchoBola/4<posBloque_Y+altoBloque)
      && (b.posBola_X+b.anchoBola/2>posBloque_X && b.posBola_X+b.anchoBola/2<posBloque_X+anchoBloque)) {
        //println("Choco a lado IZQ");
        b.velX=-abs(b.velX);
        golpes--;
        return true;
      }
 
    //si bola choca con lado derecho de un bloque
   if ((b.posBola_Y+b.anchoBola/4>posBloque_Y && b.posBola_Y-b.anchoBola/4<posBloque_Y+altoBloque)
      && (b.posBola_X-b.anchoBola/2<posBloque_X+anchoBloque && b.posBola_X-b.anchoBola/2>posBloque_X)) {
        //println("Choco a lado DER");
        b.velX=abs(b.velX);
        golpes--;
        return true;
      }
  return false;
  }
}
