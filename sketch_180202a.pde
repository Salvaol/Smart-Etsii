void setup()
{
   size(800, 600);
}

float ballX = 25;
float ballY = 25;
float speedX = 5;
float speedY = 5;
int hit = 0;
int miss = 0;

void draw()
{
  if(mousePressed){ hit = 0; miss = 0; }
  
  float paddle = 1000/(hit+10);
  if(ballX < 10 || ballX > width-25) speedX = -speedX;
  if(ballY > height-25 || ballY < 10) speedY = -speedY;
 
  ballX += speedX;
  ballY += speedY;
  
  background(100, 200, 50);
  
  fill(255);
  rect(0,150,150,300);
  fill(100, 200, 50);
  rect(10,160,130,280);
  
  fill(255);
  rect(650,150,150,300);
  fill(100, 200, 50);
  rect(660,160,130,280);
  
  fill(255);
  rect(0,250,50,100);
  fill(100, 200, 50);
  rect(10,260,30,80);
  
  fill(255);
  rect(750,250,50,100);
  fill(100, 200, 50);
  rect(760,260,30,80);  
  
  fill(255);
  ellipse(0,0,80,80);
  fill(100, 200, 50);
  ellipse(0,0,60,60); 
  
  fill(255);
  ellipse(800,0,80,80);
  fill(100, 200, 50);
  ellipse(800,0,60,60); 
  
  fill(255);
  ellipse(0,600,80,80);
  fill(100, 200, 50);
  ellipse(0,600,60,60); 
  
  fill(255);
  ellipse(800,600,80,80);
  fill(100, 200, 50);
  ellipse(800,600,60,60);  
  
  fill(255);
  ellipse(100,300,10,10);
  fill(255);
  ellipse(700,300,10,10);   
  
  fill(255);
  ellipse(395,295,150,150);
  fill(100, 200, 50);
  ellipse(395,295,130,130);
  fill(255);
  rect(0,0,800,10);
  fill(255);
  rect(0,0,10,600);
  fill(255);
  rect(0,590,800,10);
  fill(255);
  rect(790,0,10,600);
  fill(255);
  rect(390,0,10,600);
  fill(200, 100, 50);

  ellipse(ballX, ballY, 20, 20);
  
  fill(0);
  text("Goles Madrid CF: " + hit, 200, 100);
  text("Goles Málaga CF: " + miss, 500, 100);
  
}