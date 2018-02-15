class portero extends jugador{
 
  //Posición x de las dos barras de porteros  
  float p1;
  float p2;
  
  portero(){
    p1=179;
    p2=1419;
    }

//Esta función comprueba que equipo dibujamos, para saber que posición de x aplicar. 
//Se toma como referencia el jugador de más abajo y se suma la distancia.    
  void dibujarportero(int equipo, float cordy, float angulo){
    if(equipo==1){
      fill(255,255,255);
      dibujarport(p1,cordy,angulo);
    }
    if(equipo==2) {
      fill(0,0,0);
      dibujarport(p2,cordy,angulo);
    }
  }

}