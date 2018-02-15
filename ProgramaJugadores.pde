/********************************************/
/***********Programa con jugadores***********/
/********************************************/


PImage img;

portero port1 = new portero();
portero port2 = new portero();
defensa def1 = new defensa();
defensa def2 = new defensa();
medio med1 = new medio();
medio med2 = new medio();
delantero del1 = new delantero();
delantero del2 = new delantero();
bola bola=new bola();


//Contador de goles de equipo
int gol1 = 0;
int gol2 = 0;

//Dimensiones futbolín
int ysup=50;
int yinf=872;
int xizq=115;
int xdcha=1480;
int yareasup=341;
int yareainf=580;

int a=0; //Bandera para impedir contar un gol más de una vez.

void setup(){
  
  size(1599, 1000);
   
  img=loadImage("Campo2.png"); //Cargamos la imagen. Dimensiones 1599,923

}

void draw(){
  background(255,255,255);
  image(img,0, 0); // Se dibuja el fondo

  //Dibujo de la bola
  bola.posicionbola();
  bola.dibujarbola();
  
  //Dibujo del marcador
  fill(0);  
  textSize(30);
  text("Goles Madrid CF: ", 450, 950);
  fill(255,0,0);
  text(+ gol1, 720, 950);
  fill(0);
  text("Goles Málaga CF: ", 900, 950);
  fill(255,0,0);
  text(+ gol2, 1170, 950);
  
  port1.dibujarportero(1, 461.5, 0);
  port2.dibujarportero(2, 461.5, 0);
  def1.dibujarjugador(1, 300, 0);
  def2.dibujarjugador(2, 300, 0);
  med1.dibujarjugador(1, 203.5, 0); //He puesto 203.5 para que los jugadores estén centrados, vale cualquiera
  med2.dibujarjugador(2, 203.5, 0);
  del1.dibujarjugador(1, 263.5, 0);
  del2.dibujarjugador(2, 263.5, 0);
  
}

void mousePressed(){
  bola.playjuego();
  bola.dibujarbola();
}