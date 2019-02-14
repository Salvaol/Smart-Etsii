/***********************************************************/
/************* Base Simulación con dimensiones *************/
/***********************************************************/

import processing.net.*;

//Cargamos la imagen de fondo en el programa
PImage fondo;

//Dimensiones de la imagen del fondo. El alto sale por proporción
int anchoimg=1400;

//Dimensiones futbolín
float ysup=0.04*anchoimg/1.36;
float yinf=0.74*anchoimg/1.36;
float xizq=0.1*anchoimg/1.36;
float xdcha=1.26*anchoimg/1.36;
float yareasup=(0.35-0.207/2+0.04)*anchoimg/1.36;
float yareainf=(0.35+0.207/2+0.04)*anchoimg/1.36;
float xmedio = 0.68*anchoimg/1.36;
float xmarcador = 0.485*anchoimg/1.36;
float ymarcador = 0.8*anchoimg/1.36;
float anchomarcador = 0.39*anchoimg/1.36;
float altomarcador = 0.1*anchoimg/1.36;

//Creamos todos los objetos de los jugadores y bola
bola bola=new bola();
portero port1 = new portero();
portero port2 = new portero();
defensa def1 = new defensa();
defensa def2 = new defensa();
medio med1 = new medio();
medio med2 = new medio();
delantero del1 = new delantero();
delantero del2 = new delantero();

//Contador de goles de equipo
int gol1 = 0;
int gol1def=0;
int gol2 = 0;
int gol2def=0;

//Banderas
int a=0; //Bandera para impedir contar un gol más de una vez.
int gol=0; //Bandera que señala si se ha marcado gol
int mostrargol=0;

//Variables de comunicación por Sockets
int port = 10002;
boolean myServerRunning = true;

//Parámetros para la trama
float posxbola=bola.posX;
float posybola=bola.posY;
float posport = port2.posY2;
float angport = 0; 
float posdef = def2.posY2; 
float angdef = 0;
float posmed = med2.posY2;
float angmed = 0;
float posdel = del2.posY2;
float angdel = 0;

String[] aux;
String enviar;

Server myServer;

PFont fontnumber;
PFont fontpausa;
float ancholetra = 0.06*anchoimg/1.36;

void setup(){
  
    size(1500, 1000); //Obligatorio poner estos valores de forma numérica. El primer valor corresponde a la variable anchoimg
   
    myServer = new Server(this, port); // Starts a myServer on port 10002
  
    fontnumber = createFont("digital-7.ttf", ancholetra);
    fontpausa = createFont("digital-7.ttf", ancholetra*2); 
    
    fondo=loadImage("Campo2.png"); //Cargamos la imagen. Dimensiones 1599,923
    fondo.resize(anchoimg,0); //resize(ancho, alto), al poner alto=0 se mantienen proporciones
}


void draw(){
  //Pintamos el fondo de la pantalla, introducimos la imagen del futbolín
    background(255,255,255);
    image(fondo,0, 0); // Se dibuja el fondo
    
  
  //Coprobamos que Inteligencia está conectado al socket y leemos la información enviada
    if (myServerRunning == true){
      Client thisClient = myServer.available();
      if (thisClient != null) {
        if (thisClient.available() > 0) {
          ProcessMessage(thisClient.readString());
        }
      }
    }
    
    if(mostrargol> 0 && mostrargol<100){
      fill(255,0,0);  
      text("GOOOL",  xizq  , ymarcador + 0.09*anchoimg/1.36  ); 
      fill(0);
      mostrargol++;
      }
    else mostrargol=0;
    
    if (gol1def==1){
      gol1++;
      gol1def=0;
      mostrargol=1;
    }
    
    if (gol2def==1){
      gol2++;
      gol2def=0;
      mostrargol=1;
    }
    
    dibujarmarcador();
    dibujarporteria();
    stroke(0);
        
  //Se calcula la nueva posición de la bola, se dibuja y se comprueba si hay gol
    bola.dibujarbola(posxbola, posybola); //Dibuja en la nueva posición calculada
    
    port1.dibujarportero(1, 0, 0);
    def1.dibujarjugador (1, 0, 0);
    med1.dibujarjugador (1, 0, 0);
    del1.dibujarjugador (1, 0, 0); 
        
    port2.dibujarportero(2, posport, angport);
    def2.dibujarjugador (2, posdef , angdef);
    med2.dibujarjugador (2, posmed, angmed);
    del2.dibujarjugador (2, posdel, angdel); 
       
}


/*****************/
/****FUNCIONES****/
/*****************/

//Función que permite procesar la información mandada a través de sockets por Inteligencia y Control
void ProcessMessage (String message){
    aux = split(message, ":");
    if(aux[0]=="#" && aux[13]=="#"){

      posport=float(aux[1])*anchoimg/1.36+ysup;
      angport=float(aux[2]);
      posdef=float(aux[3])*anchoimg/1.36+ysup;
      angdef=float(aux[4]);
      posmed=float(aux[5])*anchoimg/1.36+ysup;
      angmed=float(aux[6]);
      posdel=float(aux[7])*anchoimg/1.36+ysup;
      angdel=float(aux[8]);
      posxbola=float(aux[9])*anchoimg/1.36+ysup;
      posybola=float(aux[10])*anchoimg/1.36+ysup;
      gol1def=int(aux[11]);
      gol2def=int(aux[12]);
    }    
}

void dibujarmarcador(){
  
    fill(0,0,0);
    rect(xmarcador, ymarcador , anchomarcador, altomarcador);
    fill(128);
    rect(xmarcador + 0.015*anchoimg/1.36, ymarcador + 0.015*anchoimg/1.36, anchomarcador - 0.03*anchoimg/1.36, altomarcador -0.03*anchoimg/1.36);
    
    textFont(fontnumber);
    fill(0);
    text("RM: ", xmarcador + 0.05*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 );
    fill(255,0,0);
    text(gol1, xmarcador + 0.12*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 );   
    fill(0);
    text("-", xmarcador + 0.18*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 );
    text("AM: ", xmarcador + 0.24*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 );
    fill(255,0,0);
    text(gol2, xmarcador + 0.31*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 ); 
}


void dibujarporteria(){
  
    fill(256,256,256);
    stroke(256,256,256);
    
    //líneas verticales porteria izq
    rect(0.06*anchoimg/1.36, yareasup, 0.0039*anchoimg/1.36, 0.207*anchoimg/1.36); 
    rect(0.07*anchoimg/1.36, yareasup, 0.001*anchoimg/1.36, 0.207*anchoimg/1.36); 
    rect(0.08*anchoimg/1.36, yareasup, 0.001*anchoimg/1.36, 0.207*anchoimg/1.36); 
    rect(0.09*anchoimg/1.36, yareasup, 0.001*anchoimg/1.36, 0.207*anchoimg/1.36); 
    
    //líneas horizontales porteria izq
    rect(0.06*anchoimg/1.36, yareasup, 0.036*anchoimg/1.36, 0.002*anchoimg/1.36);
    rect(0.06*anchoimg/1.36, yareainf, 0.036*anchoimg/1.36, 0.002*anchoimg/1.36);    
    for(int i=1; i<10;i++){
    rect(0.06*anchoimg/1.36, yareasup + 0.0207*anchoimg/1.36*i, 0.036*anchoimg/1.36, 0.001*anchoimg/1.36);
    }
    
    //líneas verticales porteria dcha
    rect(1.3*anchoimg/1.36, yareasup, 0.0039*anchoimg/1.36, 0.209*anchoimg/1.36); 
    rect(1.29*anchoimg/1.36, yareasup, 0.001*anchoimg/1.36, 0.207*anchoimg/1.36); 
    rect(1.28*anchoimg/1.36, yareasup, 0.001*anchoimg/1.36, 0.207*anchoimg/1.36); 
    rect(1.27*anchoimg/1.36, yareasup, 0.001*anchoimg/1.36, 0.207*anchoimg/1.36); 
    
    //líneas horizontales porteria dcha
    rect(1.264*anchoimg/1.36, yareasup, 0.036*anchoimg/1.36, 0.002*anchoimg/1.36);
    rect(1.264*anchoimg/1.36, yareainf, 0.036*anchoimg/1.36, 0.002*anchoimg/1.36);    
    for(int i=1; i<10;i++){
    rect(1.264*anchoimg/1.36, yareasup + 0.0207*anchoimg/1.36*i, 0.036*anchoimg/1.36, 0.001*anchoimg/1.36);
    }    
}