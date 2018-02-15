class delantero extends jugador{

  //Posición x de las dos barras de delantero
  float del1;
  float del2;
  
  delantero(){
    del1=1063;
    del2=535;
    }

//Esta función comprueba que equipo dibujamos, para saber que posición de x aplicar. 
//Se toma como referencia el jugador de más abajo y se suma la distancia.
  void dibujarjugador(int equipo, float cordy,float angulo){
    if(equipo==1){
      fill(255,255,255);
      dibujarjug(del1,cordy,angulo);
      dibujarjug(del1,cordy+198,angulo);
      dibujarjug(del1,cordy+198*2,angulo);
    }
    
    if(equipo==2){
      fill(0,0,0);
      dibujarjug(del2,cordy,angulo);
      dibujarjug(del2,cordy+198,angulo);
      dibujarjug(del2,cordy+198*2,angulo);
    }
    
  }
  
}