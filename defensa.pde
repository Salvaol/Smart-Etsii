class defensa extends jugador{
  
  //Posición límite superior e inferior del jugador inferior
  float ymax;
  float ymin;
     
  defensa(){
    posX1=0.305*anchoimg/1.36;
    posX2=1.055*anchoimg/1.36;
    distancia=0.228*anchoimg/1.36;
    posY1=0.39*anchoimg/1.36+distancia/2;
    posY2=0.39*anchoimg/1.36+distancia/2;
    ymax=(0.74-0.06)*anchoimg/1.36-anchojug/2;
    ymin=(0.1)*anchoimg/1.36+distancia+anchojug/2;
    velY=0;
  }
    
//Esta función comprueba que equipo dibujamos, para saber que posición de x aplicar. 
//Se toma como referencia el jugador de más abajo y se suma la distancia. 
  void dibujarjugador(int equipo, float mov, float angulo){
    
    if(equipo==1){
      fill(255,255,255);
      
      if((posY1+mov)>ymax){
        posY1=ymax;
      }
        
      else if ((posY1+mov)<ymin){
        posY1=ymin;
      }
        
      else{
        posY1=posY1+mov;
      }
      
      dibujarjug(posX1,posY1,angulo);
      dibujarjug(posX1,posY1-distancia,angulo);
      
    }
    
    //Función para que se muevan aleatoriamente
     if(equipo==2){
      fill(0,0,0);
      if(posY2>ymax || posY2<ymin) velY=-velY;
      posY2=posY2+velY;
      dibujarjug(posX2,posY2,angulo);
      dibujarjug(posX2,posY2-distancia,angulo);
    }
    
   //Función para dibujar en la posición que nos envían
   /*if(equipo==2){
      fill(0,0,0);
     dibujarjug(posX2, mov, angulo);
     dibujarjug(posX2,mov-distancia,angulo);
    }*/
    
}
  
}