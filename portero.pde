class portero extends jugador{
 

  //Posición x de las dos barras de porteros  
  float posX1;
  float posX2;
  
  //Posición y de las dos barras de defensa
  float posY1;
  float posY2;
  
  //Posición límite superior e inferior del jugador inferior
  float ymax;
  float ymin;
  
  portero(){
    posX1=0.152*anchoimg/1.36;
    posX2=1.207*anchoimg/1.36;
    posY1=0.39*anchoimg/1.36;
    posY2=0.39*anchoimg/1.36;
    ymax=(0.04+0.7-0.253)*anchoimg/1.36-anchojug/2;
    ymin=(0.04+0.253)*anchoimg/1.36+anchojug/2;
    velY=0;
  }

 
  void dibujarporterogol(int equipo){
    if (equipo==1) dibujarjug(posX1,posY1,0);
    if (equipo==2) dibujarjug(posX2,posY2,0);
  }
  
//Esta función comprueba que equipo dibujamos, para saber que posición de x aplicar. 
//Se toma como referencia el jugador de más abajo y se suma la distancia.       
  void dibujarportero(int equipo, float mov, float angulo){
   
    if(equipo==1){
      fill(255,255,255);      
      
      if((posY1+mov)>ymax){
        posY1=ymax;
      }
        
      else if ((posY1+mov)<ymin){
        posY1=ymin;
      }
        
      else{
      posY1=posY1+mov;}      
      dibujarjug(posX1,posY1,angulo);      
    }
    
    if(equipo==2) {
      fill(0,0,0);

      if(posY2>ymax || posY2<ymin) velY=-velY;
      posY2=posY2+velY;
      
      dibujarjug(posX2,posY2,angulo);
      /*
      dibujarjug(posX2,mov,angulo);
      */
    }  
  }
}