public class jugador{
  
  //Variables de los jugadores
  float anchojug;
  float largojug;
  float altojug;
  float radioport; 
  
  ///Posición x de la barra de cada equipo
  float posX1;
  float posX2;
  
  //Posición y de la barra de cada equipo
  float posY1;
  float posY2;
  float distancia;
  
  //Veloc crucero
  float velY;
  
  float anchoimg;
  
    public jugador(){
    anchoimg=1400;
    anchojug=0.017*anchoimg/1.36;
    largojug=0.025*anchoimg/1.36;
    altojug= 0.012*anchoimg/1.36; 
    radioport=0.02*anchoimg/1.36;
  }
  
  //Cordx y cordy son las coordenadas del centro del rectangulo 
  void dibujarjug(float cordx, float cordy, float angulo){
    if(angulo==90){
      rect(cordx-anchojug/2, cordy-largojug/2, altojug, largojug);
    }
    else if(angulo==0){
      rect(cordx-anchojug/2, cordy-largojug/2, anchojug, largojug);
    }
    else {
      rect(cordx-anchojug/2, cordy-largojug/2, anchojug, largojug);
      //rect(cordx-anchojug/2, cordy-largojug/2, anchojug + tan(radians(angulo))*altojug, largojug);
    }
    
  }
  
 // En choques se comparan pendientes y en función de la comparación devuelve un valor
 
  
 int choque (float cordx, float cordy, float angulo, float posbolaX, float posbolaY, float velX, float velY){

    if(angulo==0){
    if (abs(posbolaY-cordy)<=(largojug/2) && abs(posbolaX-cordx)<=(anchojug/2)){
    float pendientebola = velY/velX;
    //println("HOLA"); 
    if(velX>0){
      
      if((cordy-largojug/2)<= (pendientebola*(cordx-anchojug/2)-pendientebola*posbolaX+posbolaY) && (pendientebola*(cordx-anchojug/2)-pendientebola*posbolaX+posbolaY)<=(cordy+largojug/2)){
        return -1;
      }
      else{
        return 1;
      }
    }
    else {
      if((cordy-largojug/2)<= (pendientebola*(cordx+anchojug/2)-pendientebola*posbolaX+posbolaY) && (pendientebola*(cordx+anchojug/2)-pendientebola*posbolaX+posbolaY)<=(cordy+largojug/2)){
      return -1;
      }

      else{
        return 1;
        }
      }
    }
    else return 0;
  }
    else return 0;
  }
  
}