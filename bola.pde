public class bola{
  
  
  float radio;
  float posX;
  float posY;
  float velX; 
  float velY; 
  float velXini; 
  float velYini; 
  float anchoimg;
  
  bola(){
    anchoimg=1400;
    radio=0.02*anchoimg/1.36;
      //Posición inicial de la bola. 
        //Centro del campo: x=799.5 y=461.5
        //Esquina superior izq x=115 y=50
        //Esquina inferior dcha x=1480 y=872
        //Área izquierda gol: Línea superior y=341 Línea inferior y=580  Línea izq x=115
        //Área derecha gol: Línea superior y=341 Línea inferior y=580  Línea dcha x=1480
      posX=0.68*anchoimg/1.36;
      posY=0.39*anchoimg/1.36;
      
      velX=random(-3,3);
      velY=random(3,3);
      velXini=velX;
      velYini=velY;
  }
  
    
  void dibujarbola(){
      fill(#E8C39E);
      ellipse(posX, posY, radio, radio);
  }
  
  
//Actualiza la posición x e y de la bola, llamando a las subfunciones. Posteriormente se comprueba si hay gol por esta posición.
  void posicionbola(){
      posx();
      posy();
      //comprobargol();
  
  }
      
//Función que comprueba la posición x de la bola. Primero mira si hay choque con paredes 
  void posx(){
      if(posX <(xizq+radio) || posX > (xdcha-radio)) {
        velX = -velX;
        velXini=-velXini;
      }
      posX+= velX;
  }
  
//Igual que la anterior, pero para variable y
  void posy(){
      if(posY > (yinf-radio) || posY < (ysup+radio)) {
        velY = -velY;
        velYini=-velYini;
      }
      posY += velY;
      
  }
  
  
  float getx (){
    return posX;  
  }
    
  float gety (){
    return posY;
  }
  
  
  void setvel(int modo){
     
    if (modo==1){
       velX=velXini;
       velY=velYini; 
     }
     else if(modo==2){
       velX=velXini*1.5;
       velY=velYini*1.5;
     }
     else if(modo==3){
       velX=velXini*2;
       velY=velYini*2; 
     }
  }
  

//Comprueba si la bola está en la linea de gol de cualquiera de las porterías.
  void comprobargol(){
       
      //Analizamos si hay gol en la portería de la izquierda (Línea superior y=420 Línea inferior y=660  Línea izq x=117)
      if(posX < (xizq+radio) && posY < (yareainf -radio) && posY >( yareasup + radio) && mostrargol==0){
        velX=0; 
        velY=0;
        gol2++;
        mostrargol=1;        
      }
      
      //Analizamos si hay gol en la portería de la dcha (Línea superior y=420 Línea inferior y=660  Línea izq x=1480)
      else if(posX > (xdcha-radio) && posY < (yareainf-radio) && posY > (yareasup+radio) && mostrargol==0){
        velX=0; 
        velY=0;
        gol1++;
        mostrargol=1;
      }  
    }
  
//Función que se activa en el programa principal, al pulsar el ratón. Vuelve a poner en marcha la simulación.  
  void playjuego(){
        mostrargol=0; 
  
      //Si el gol es en la portería de la izq, salimos de la esquina superior izq (x=115+r y=130+r)
      if(posX < (xizq+radio) && posY < (yareainf -radio) && posY >( yareasup + radio)) {
          posX=xizq+radio;
          posY=ysup+radio;
          velX = velXini;
          velY = velYini;
      }
    
      //Si el gol es en la portería de la dcha, salimos de la esquina superior dcha (x=1480-r y=950-r)  
      if(posX > (xdcha-radio) && posY < (yareainf-radio) && posY > (yareasup+radio)){
          posX=xdcha-radio;
          posY=yinf-radio;
          velX = velXini;
          velY = velYini;
      }
  }

}