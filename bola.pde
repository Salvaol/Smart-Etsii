public class bola{
  
  
  float radio;
  float posX;
  float posY;
  float velX; 
  float velY; 
  float anchoimg;
  
  bola(){
    anchoimg=1400;
    radio=0.02*anchoimg/1.36;
    posX=0.68*anchoimg/1.36;
    posY=0.39*anchoimg/1.36;
    velX=random(-3,-3);
    velY=random(3,3);
  }
  
    
  void dibujarbola( float bolax, float bolay){
      fill(#E8C39E);
      ellipse(bolax, bolay, radio, radio);
  }
  
       
}