class bola{
  
  float radio;
  float ballX;
  float ballY;
  float speedX; 
  float speedY; 
  
  bola(){
      radio=20;
      //Posición inicial de la bola. 
        //Centro del campo: x=799.5 y=461.5
        //Esquina superior izq x=115 y=50
        //Esquina inferior dcha x=1480 y=872
        //Área izquierda gol: Línea superior y=341 Línea inferior y=580  Línea izq x=115
        //Área derecha gol: Línea superior y=341 Línea inferior y=580  Línea dcha x=1480
      ballX=799.5;
      ballY=461.5;
      speedX=5;
      speedY=6;
  }
  
//Actualiza la posición x e y de la bola, llamando a las subfunciones. Posteriormente se comprueba si hay gol por esta posición.
  void posicionbola(){
      posx();
      posy();
      comprobargol();
  
  }
  
  
  void dibujarbola(){
      fill(#E8C39E);
      ellipse(ballX, ballY, radio, radio);
  }
    
//Función que comprueba la posición x de la bola. Primero mira si hay choque con paredes 
  void posx(){
      if(ballX <(xizq+radio) || ballX > (xdcha-radio)) speedX = -speedX;
      ballX+= 2*speedX;
  }
  
//Igual que la anterior, pero para variable y
  void posy(){
      if(ballY > (yinf-radio) || ballY < (ysup+radio)) speedY = -speedY;
      ballY += 2*speedY;
  }
  
//Comprueba si la bola está en la linea de gol de cualquiera de las porterías.
  void comprobargol(){
       
      //Analizamos si hay gol en la portería de la izquierda (Línea superior y=420 Línea inferior y=660  Línea izq x=117)
      if(ballX < (xizq+radio) && ballY < (yareainf -radio) && ballY >( yareasup + radio) && a==0){
        speedX=0; 
        speedY=0;
        gol1++;
        a=1;
      }
      
      //Analizamos si hay gol en la portería de la dcha (Línea superior y=420 Línea inferior y=660  Línea izq x=1480)
      if(ballX > (xdcha-radio) && ballY < (yareainf-radio) && ballY > (yareasup+radio) && a==0){
        speedX=0; 
        speedY=0;
        gol2++;
        a=1;
      }  
    }
  
//Función que se activa en el programa principal, al pulsar el ratón. Vuelve a poner en marcha la simulación.  
  void playjuego(){
        a=0; 
  
      //Si el gol es en la portería de la izq, salimos de la esquina superior izq (x=115+r y=130+r)
      if(ballX < (xizq+radio) && ballY < (yareainf -radio) && ballY >( yareasup + radio)) {
          ballX=xizq+radio;
          ballY=ysup+radio;
          speedX = 6;
          speedY = 5;  
      }
    
      //Si el gol es en la portería de la dcha, salimos de la esquina superior dcha (x=1480-r y=950-r)  
      if(ballX > (xdcha-radio) && ballY < (660-radio) && ballY > (420+radio)){
          ballX=xdcha-radio;
          ballY=yinf-radio;
          speedX = -5;
          speedY = -7;      
      }
  }

}