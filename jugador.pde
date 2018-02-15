class jugador{
  
  float anchojug;
  float largojug;
  float altojug;
  float radioport; 
  
  jugador(){
    anchojug=23.5;
    largojug=29;
    altojug= 138; //Comprobar este valor, que está cogido a ojo.
    radioport=23.5;
  }
  
  void dibujarjug(float cordx, float cordy, float angulo){
    rect(cordx-anchojug/2, cordy+anchojug/2, anchojug + tan(radians(angulo))*altojug, largojug);
    
  }

    void dibujarport(float cordx, float cordy, float angulo){
    ellipse(cordx, cordy, radioport + tan(radians(angulo))*radioport, radioport);
  }
  
}