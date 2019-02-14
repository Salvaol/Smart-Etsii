class delantero extends jugador{

  //Posición x de las dos barras de delantero
  float posX1;
  float posX2;
  
  //Posición y de las dos barras de defensa
  float posY1;
  float posY2;
  float distancia;
  
  //Posición límite superior e inferior del jugador inferior
  float ymax;
  float ymin;
  
  delantero(){
    posX1=0.905*anchoimg/1.36;
    posX2=0.455*anchoimg/1.36;
    distancia=0.172*anchoimg/1.36;
    posY1=0.39*anchoimg/1.36+distancia;
    posY2=0.39*anchoimg/1.36+distancia;
    ymax=(0.74-0.06)*anchoimg/1.36-anchojug/2;
    ymin=(0.1)*anchoimg/1.36+distancia*2+anchojug/2;
    velY=2;
    }

//Esta función comprueba que equipo dibujamos, para saber que posición de x aplicar. 
//Se toma como referencia el jugador de más abajo y se suma la distancia.
  void dibujarjugador(int equipo, float mov, float angulo){
    if(equipo==1){
      fill(255,255,255, 150);
     
      dibujarjug(posX1,posY1,angulo);
      dibujarjug(posX1,posY1-distancia,angulo);
      dibujarjug(posX1,posY1-distancia*2,angulo);
      
    }
    
    if(equipo==2){
      fill(0,0,0);
     
      dibujarjug(posX2, mov, angulo);
      dibujarjug(posX2,mov - distancia,angulo);
      dibujarjug(posX2,mov-distancia*2,angulo);   
    }
    
  }  
  
}