class medio extends jugador{

  //Posición x de las dos barras de centrocampistas  
  float med1;
  float med2;
  
  medio(){
    med1=712;
    med2=887;
    }

//Esta función comprueba que equipo dibujamos, para saber que posición de x aplicar. 
//Se toma como referencia el jugador de más abajo y se suma la distancia.    
  void dibujarjugador(int equipo, float cordy,float angulo){
    if(equipo==1){
      fill(255,255,255);
      dibujarjug(med1,cordy,angulo);
      dibujarjug(med1,cordy+129,angulo);
      dibujarjug(med1,cordy+129*2,angulo);
      dibujarjug(med1,cordy+129*3,angulo);
      dibujarjug(med1,cordy+129*4,angulo);
    }
    
    if(equipo==2){
      fill(0,0,0);
      dibujarjug(med2,cordy,angulo);
      dibujarjug(med2,cordy+129,angulo);
      dibujarjug(med2,cordy+129*2,angulo);
      dibujarjug(med2,cordy+129*3,angulo);
      dibujarjug(med2,cordy+129*4,angulo);
    }
    
  }

}