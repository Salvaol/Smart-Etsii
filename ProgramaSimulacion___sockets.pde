/***********************************************************/
/************* Base Simulación con dimensiones *************/
/***********************************************************/

//Jugamos con el equipo blanco de la izq. (team 1)

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
int gol2 = 0;

//variables de choque
int choque1 = 0;
int choque2 = 0;
int choque3 = 0;
int choque4 = 0;
int choque5 = 0;
int choque6 = 0;
int choque7 = 0;
int choque8 = 0;
int choque9 = 0;
int choque10 = 0;
int choque11 = 0;
int choque12 = 0;
int choque13 = 0;
int choque14 = 0;
int choque15 = 0;
int choque16 = 0;
int choque17 = 0;
int choque18 = 0;
int choque19 = 0;
int choque20 = 0;
int choque21 = 0;
int choque22 = 0;
int suma=0;

//Banderas
int mostrargol=0; //Bandera para impedir contar un gol más de una vez.
int gol=0; //Bandera que señala si se ha marcado gol
int barraselec=3;
int pausa=0;
int banderapausa=0;
int nivel=1;

//Movimiento de los jugadores
int puntos=0;
int puntosport=0;
int puntosdef=0;
int puntosmed=0;
int puntosdel=0;

//Variables de comunicación por Sockets
int port = 10002;
boolean myServerRunning = true;

//Parámetros para la trama
float posport,angport, posdef, angdef,posmed, angmed, posdel, angdel;
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
    
    dibujarmarcador();
    dibujarporteria();
    dibujarimprimirmodo();
    stroke(0);
  
  //Código de dibujar según si el juego está parado o no
    if(pausa==1 || mostrargol==1){
   
      bola.dibujarbola(); //Dibuja en la nueva posición calculada
      port1.dibujarportero(1, puntosport, 0);
      def1.dibujarjugador(1, puntosdef, 0);
      med1.dibujarjugador(1, puntosmed, 0);
      del1.dibujarjugador(1, puntosdel, 0);
      
      port2.dibujarportero(2, posport, angport);
      def2.dibujarjugador (2, posdef , angdef);
      med2.dibujarjugador (2, posmed, angmed);
      del2.dibujarjugador (2, posdel, angdel); 
      
      fill(255,0,0);

      puntos=0;
      if(mostrargol==1){
        textFont(fontpausa);
        text("GOOOOOOL",  xmedio - 0.2*anchoimg/1.36  , 0.35*anchoimg/1.36 + 0.06*anchoimg/1.36 ); 
      }
      
      if(pausa==1){
        textFont(fontpausa);
        text("pausa",  xizq  , ymarcador + 0.09*anchoimg/1.36  ); 
        //estas condiciones son para evitar los rebotes al soltar la tecla P
        if (banderapausa<25){
          println(banderapausa);
          key='0';
          banderapausa++;}
        
        else{   
          if(key=='p' || key=='P'){
            if(banderapausa<50){
              banderapausa++;
              println(banderapausa);}
            else {
              key='0';
              banderapausa=0;
              pausa=0;}
          }  
        }
      }
    } 
   
  //Si el juego NO está parado   
    else{
     //Coprobamos que Inteligencia está conectado al socket y leemos la información enviada
      if (myServerRunning == true){
        Client thisClient = myServer.available();
        if (thisClient != null) {
          if (thisClient.available() > 0) {
            ProcessMessage(thisClient.readString());
          }
        }
      }
        
     //Se calcula la nueva posición de la bola, se dibuja y se comprueba si hay gol
      bola.posicionbola(); //Calcula la nueva posición
      bola.dibujarbola(); //Dibuja en la nueva posición calculada
      bola.comprobargol();
      
    //Se dibujan los jugadores. Los parámetros son: el equipo al que pertenecen, posición y el ángulo 
      port1.dibujarportero(1, puntosport, 0);
      def1.dibujarjugador(1, puntosdef, 0);
      med1.dibujarjugador(1, puntosmed, 0);
      del1.dibujarjugador(1, puntosdel, 0);
      
      port2.dibujarportero(2, posport, angport);
      def2.dibujarjugador (2, posdef , angdef);
      med2.dibujarjugador (2, posmed, angmed);
      del2.dibujarjugador (2, posdel, angdel); 
      
    //Se inicializan a 0 las variables que cuantifican cuanto debe moverse cada jugador y se mantienen a 0 para que solo cuando haya un evento de la rueda se muevan los jugadores
      puntosport=0; 
      puntosdef=0;
      puntosmed=0;
      puntosdel=0;
      puntos=0;
    
    //Calculo de choques 
      suma=comprobarchoques();
    
    // Analizamos la suma, si devuelve 1 cambiamos la velocidad en y y si es menos 1 en X. 
      if (suma==1){
        bola.velY=-bola.velY;
        bola.velYini=-bola.velYini;
      }
      else if (suma==-1){
        bola.velX=-bola.velX;
        bola.velXini=-bola.velXini;
      }
    
    //Comprobamos la barra que está activa y si esta debe moverse al haberse movido la rueda del ratón
      barraactiva();
   
    //Envio de información a inteligencia y control
      enviar= "#" + ":" + str(bola.getx()) + ":" + str(bola.gety())+ ":" + str(bola.posX)+ ":" + str(bola.posY) + ":" + "#";
      myServer.write(enviar);
    }
}



/*****************/
/****FUNCIONES****/
/*****************/



//Esta función detecta la tecla pulsada y la guarda para analizarlo
void keyPressed(){
}


//Esta función permite comprobar qué barra esta activa
void barraactiva(){  
  fill(255,0,0);
  
  //Dibujamos triángulo que índica que barra controla el jugador por teclado
  switch(key){
        case 'q': {triangle(port1.posX1 - 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, port1.posX1 + 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, port1.posX1, 0.75*anchoimg/1.36); 
                    barraselec=1;
                    break;}
        case 'Q': {triangle(port1.posX1 - 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, port1.posX1 + 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, port1.posX1, 0.75*anchoimg/1.36);
                    barraselec=1;
                    break;}
        case 'W': {triangle(def1.posX1 - 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, def1.posX1 + 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, def1.posX1, 0.75*anchoimg/1.36);
                    barraselec=2;
                    break;}
        case 'w': {triangle(def1.posX1 - 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, def1.posX1 + 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, def1.posX1, 0.75*anchoimg/1.36);
                    barraselec=2;
                    break;}
        case 'E': {triangle(med1.posX1 - 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, med1.posX1 + 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, med1.posX1, 0.75*anchoimg/1.36);
                    barraselec=3;
                    break;}
        case 'e': {triangle(med1.posX1 - 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, med1.posX1 + 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, med1.posX1, 0.75*anchoimg/1.36);
                    barraselec=3;
                    break;}
        case 'r': {triangle(del1.posX1 - 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, del1.posX1 + 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, del1.posX1, 0.75*anchoimg/1.36);
                    barraselec=4;
                    break;}   
        case 'R': {triangle(del1.posX1 - 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, del1.posX1 + 0.02*anchoimg/1.36, 0.77*anchoimg/1.36, del1.posX1, 0.75*anchoimg/1.36);
                    barraselec=4;
                    break;}
        case 'p': {pausa=1;
                    break;}
                    
        case'P': {pausa=1;
                   break;}
        case '1':{bola.setvel(1);
                  nivel=1;
                  break; }
        case '2':{bola.setvel(2);
                  nivel=2;
                  break;}
        case '3':{bola.setvel(3);
                  nivel=3;
                  break;}
  }
}


//Esta función detecta la pulsación del ratón para dar a play al juego
void mousePressed(){
  bola.playjuego();
  bola.dibujarbola();   
}

//Función que detecta el movimiento de la rueda y calcula qué jugadores deben moverse y cuánto
void mouseWheel(MouseEvent event){
  //Se calcula la cantidad de movimiento registrado para un jugador 
  puntos+=event.getCount();
   
   switch(key){
     case 'q': {  
                 puntosport=puntos*20; 
                 puntosdef=0;
                 puntosmed=0;
                 puntosdel=0;
                 puntos=0;
                 break;}
     case 'Q': {
                 puntosport=puntos*20;
                 puntosdef=0;
                 puntosmed=0;
                 puntosdel=0;
                 puntos=0;               
                 break;}
     case 'W': {
                 puntosport=0;
                 puntosdef=puntos*20;
                 puntosmed=0;
                 puntosdel=0;
                 puntos=0;
                 break;}
     case 'w': {
                 puntosport=0;
                 puntosdef=puntos*20;
                 puntosmed=0;
                 puntosdel=0;
                 puntos=0;
                 break;}
     case 'E': {
                 puntosport=0;
                 puntosdef=0;
                 puntosmed=puntos*20;
                 puntosdel=0;
                 puntos=0;
                 break;}
     case 'e': {
                 puntosport=0;
                 puntosdef=0;
                 puntosmed=puntos*20;
                 puntosdel=0;
                 puntos=0;
                 break;}
     case 'r': {
                 puntosport=0;
                 puntosdef=0;
                 puntosmed=0;
                 puntosdel=puntos*30;
                 puntos=0;
                 break;}
     case 'R': {
                 puntosport=0;
                 puntosdef=0;
                 puntosmed=0;
                 puntosdel=puntos*30;
                 puntos=0;
                 break;}                 
     }
}

//Función que comprueba los choques de bola-jugador
int comprobarchoques(){
  //Choque portero con bola
    choque1=port1.choque(port1.posX1, port1.posY1,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque2=port2.choque(port2.posX2, port2.posY2,angport,bola.posX,bola.posY,bola.velX,bola.velY);
  
  //Choque de defensa con bola
    choque3=def1.choque(def1.posX1, def1.posY1,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque4=def1.choque(def1.posX1, def1.posY1-def1.distancia,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque5=def2.choque(def2.posX2, def2.posY2,angdef,bola.posX,bola.posY,bola.velX,bola.velY);
    choque6=def2.choque(def2.posX2, def2.posY2-def2.distancia,angdef,bola.posX,bola.posY,bola.velX,bola.velY);
  
  //Choque de medios con bola
    choque7=med1.choque(med1.posX1, med1.posY1,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque8=med1.choque(med1.posX1, med1.posY1-med1.distancia,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque9=med1.choque(med1.posX1, med1.posY1-med1.distancia*2,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque10=med1.choque(med1.posX1, med1.posY1-med1.distancia*3,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque11=med1.choque(med1.posX1, med1.posY1-med1.distancia*4,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque12=med2.choque(med2.posX2, med2.posY2,angmed,bola.posX,bola.posY,bola.velX,bola.velY);
    choque13=med2.choque(med2.posX2, med2.posY2-med2.distancia,angmed,bola.posX,bola.posY,bola.velX,bola.velY);
    choque14=med2.choque(med2.posX2, med2.posY2-med2.distancia*2,angmed,bola.posX,bola.posY,bola.velX,bola.velY);
    choque15=med2.choque(med2.posX2, med2.posY2-med2.distancia*3,angmed,bola.posX,bola.posY,bola.velX,bola.velY);
    choque16=med2.choque(med2.posX2, med2.posY2-med2.distancia*4,angmed,bola.posX,bola.posY,bola.velX,bola.velY);
  
  //Choque delanteros con bola  
    choque17=del1.choque(del1.posX1, del1.posY1,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque18=del1.choque(del1.posX1, del1.posY1-del1.distancia,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque19=del1.choque(del1.posX1, del1.posY1-del1.distancia*2,0.0,bola.posX,bola.posY,bola.velX,bola.velY);
    choque20=del2.choque(del2.posX2, del2.posY2,angdel,bola.posX,bola.posY,bola.velX,bola.velY);
    choque21=del2.choque(del2.posX2, del2.posY2-del2.distancia,angdel,bola.posX,bola.posY,bola.velX,bola.velY);
    choque22=del2.choque(del2.posX2, del2.posY2-del2.distancia*2,angdel,bola.posX,bola.posY,bola.velX,bola.velY);     
 
    return ( choque1 +choque2 +choque3 +choque4 +choque5 +choque6 +choque7 +choque8 +choque9 +choque10 +choque11 +choque12 +choque13 +choque14 +choque15 +choque16 +choque17 +choque18 +choque19 +choque20 +choque21 +choque22);
}


//Función que permite procesar la información mandada a través de sockets por Inteligencia y Control
void ProcessMessage (String message){
    aux = split(message, ":");
    if(aux[0]=="#" && aux[9]=="#"){
      posport=float(aux[1])*anchoimg/1.36+ysup;
      angport=float(aux[2]);
      posdef=float(aux[3])*anchoimg/1.36+ysup;
      angdef=float(aux[4]);
      posmed=float(aux[5])*anchoimg/1.36+ysup;
      angmed=float(aux[6]);
      posdel=float(aux[7])*anchoimg/1.36+ysup;
      angdel=float(aux[8]);
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
    text(+ gol1, xmarcador + 0.12*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 );   
    fill(0);
    text("-", xmarcador + 0.18*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 );
    text("AM: ", xmarcador + 0.24*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 );
    fill(255,0,0);
    text(+ gol2, xmarcador + 0.31*anchoimg/1.36, ymarcador + 0.07*anchoimg/1.36 ); 
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

void dibujarimprimirmodo(){
     textFont(fontnumber);
     fill(0);
     text("Nivel:", 1.055*anchoimg/1.36 , ymarcador + 0.04*anchoimg/1.36  ); 
     text(nivel, 1.055*anchoimg/1.36 + 0.15*anchoimg/1.36, ymarcador + 0.04*anchoimg/1.36 ); 
}