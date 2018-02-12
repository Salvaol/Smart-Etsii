/*********************************************/
/********Programa con fondo y márgenes********/
/*********************************************/


PImage img;

float radio=20;

//Posición inicial de la bola. 
    //Centro del campo: x=798 y=540
    //Esquina superior izq x=115 y=130
    //Esquina inferior dcha x=1480 y=950
    //Área izquierda gol: Línea superior y=420 Línea inferior y=660  Línea izq x=117
    //Área derecha gol: Línea superior y=420 Línea inferior y=660  Línea dcha x=1480
float ballX = 798;
float ballY = 540;

//Velocidad de la bola
float speedX = 5; 
float speedY = 6; 

//Contador de goles de equipo
int gol1 = 0;
int gol2 = 0;

int a=0; //Bandera para impedir contar un gol más de una vez.

void setup(){
  
  size(1599, 1000);
   
  img=loadImage("fondocompleto.JPG"); //Cargamos la imagen. Dimensiones 1599, 917 

}

void draw(){
  
  image(img,0, 0); // Se dibuja el fondo

  //Cálculo de velocidad de la bola para la posición
  if(ballX <125 || ballX > width-130) speedX = -speedX;
  if(ballY > height-60 || ballY < 140) speedY = -speedY;
  
  
  //Analizamos si hay gol en la portería de la izquierda (Línea superior y=420 Línea inferior y=660  Línea izq x=117)
  if(ballX < (120+radio) && ballY < (660-radio) && ballY >( 420 + radio) && a==0){
    speedX=0; 
    speedY=0;
    gol1++;
    a=1;
  }
  
  //Analizamos si hay gol en la portería de la dcha (Línea superior y=420 Línea inferior y=660  Línea izq x=1480)
  if(ballX > (1490-radio) && ballY < (660-radio) && ballY > (420+radio) && a==0){
    speedX=0; 
    speedY=0;
    gol2++;
    a=1;
  }  
  
  ballX += speedX;
  ballY += speedY;
  
  
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
  
}

void mousePressed(){
  
  a=0; 
  
  //Si el gol es en la portería de la izq, salimos de la esquina superior izq (x=115+r y=130+r)
  if(ballX < (120+radio) && ballY < (660-radio) && ballY >( 420 + radio)) {
    ballX=115+radio;
    ballY=130+radio;
    speedX = 6;
    speedY = 5;  
  }
  
  //Si el gol es en la portería de la dcha, salimos de la esquina superior dcha (x=1480-r y=950-r)  
  if(ballX > (1490-radio) && ballY < (660-radio) && ballY > (420+radio)){
    ballX=1480-radio;
    ballY=950-radio;
    speedX = -5;
    speedY = -7;      
  } 
  
}
  
  