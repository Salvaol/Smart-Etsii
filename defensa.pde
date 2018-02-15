class defensa extends jugador{

  //Posición x de las dos barras de defensa
  float def1;
  float def2;
  
  defensa(){
    def1=359;
    def2=1241;
    }
    
//Esta función comprueba que equipo dibujamos, para saber que posición de x aplicar. 
//Se toma como referencia el jugador de más abajo y se suma la distancia. 
  void dibujarjugador(int equipo, float cordy, float angulo){
    
    if(equipo==1){
      fill(255,255,255);
      dibujarjug(def1,cordy,angulo);
      dibujarjug(def1,cordy+262,angulo);
    }
    
    if(equipo==2){
      fill(0,0,0);
      dibujarjug(def2,cordy,angulo);
      dibujarjug(def2,cordy+262,angulo);
    }
    
  }

}