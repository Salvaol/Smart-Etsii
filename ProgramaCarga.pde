/******************************************************/
/********Programa con posiciones de bola en txt********/
/******************************************************/


PImage img;
Table tabla;

float radio=20;

//Posición inicial de la bola. 
    //Centro del campo: x=798 y=540
    //Esquina superior izq x=115 y=130
    //Esquina inferior dcha x=1480 y=950
    //Área izquierda gol: Línea superior y=420 Línea inferior y=660  Línea izq x=117
    //Área derecha gol: Línea superior y=420 Línea inferior y=660  Línea dcha x=1480
float ballX = 798;
float ballY = 540;

//Contador de goles de equipo
int gol1 = 0;
int gol2 = 0;

int xi=0;

void setup(){
  
  size(1599, 1000);
   
  img=loadImage("fondocompleto.JPG"); //Cargamos la imagen. Dimensiones 1599, 917 
  tabla= loadTable("pruebacarga.csv", "header");
}

void draw(){
  
  image(img,0, 0); // Se dibuja el fondo
  
  ballX=tabla.getInt(xi,0);
  ballY=tabla.getInt(xi,1);
  xi++;
  
 /* 
  //Analizamos si hay gol en la portería de la izquierda (Línea superior y=420 Línea inferior y=660  Línea izq x=117)
  if(ballX < (120+radio) && ballY < (660-radio) && ballY >( 420 + radio) && a==0){
    gol1++;
    a=1;
  }
  
  //Analizamos si hay gol en la portería de la dcha (Línea superior y=420 Línea inferior y=660  Línea izq x=1480)
  if(ballX > (1490-radio) && ballY < (660-radio) && ballY > (420+radio) && a==0){
    gol2++;
    a=1;
  }*/  
  
  
  //Dibujo de la bola
  fill(#E8C39E);   
  ellipse(ballX, ballY, radio, radio);
  
  //Dibujo del marcador
  fill(0);  
  textSize(30);
  text("Goles Madrid CF: ", 450, 50);
  fill(255,0,0);
  text(+ gol1, 720, 50);
  fill(0);
  text("Goles Málaga CF: ", 900, 50);
  fill(255,0,0);
  text(+ gol2, 1170, 50);
  delay(100);
}


  