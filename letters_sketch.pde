color backgroundColor;
color borderColor;

String[] filenames = {"aviao.jpg", "burro.jpg",
"cao.jpg","dado.jpg","estrela.jpg","faca.jpg",
"gato.jpg","hipopotamo.jpg","igreja.jpg","janela.jpg",
"lua.jpg","mar.jpg","nuvens.jpg","ovos.jpg","porco.jpg",
"queijo.jpg","rato.jpg","sol.jpg","tomate.jpg","urso.jpg",
"vaca.jpg","xilofone.jpg","zebra.jpg"};

PImage[] img = new PImage[filenames.length];

char randKey = randomLetter(); 
int cell = -1;
boolean showBorder = false;

void settings()
{
  size(800,600);
}
 
void setup(){
  backgroundColor = color(0,0,0);
  loadAllImages();
}

void draw(){
float imgWidth = (width/6)*0.8; //size of the images
float imgHeight = (height/4)*0.8; 
  background(backgroundColor);
  drawAllImages(imgWidth,imgHeight);
  textAlign(CENTER);
  textSize(50);
    text(randKey, width-width/6,height-height/6);
    if(cell !=-1)
    drawBorder(cell,imgWidth,imgHeight);
}

char randomLetter(){
   char rand = (char)random(65,90);
   if( rand != 'K' && rand != 'Y' && rand != 'W') 
    return rand;
   return 65;
}

int getCell(float imgWidth, float imgHeight){ //return image index at the current mouse position
  int i = 0;
  float xm = (mouseX-width*0.1)/imgWidth ;
  float xy = (mouseY-height*0.1)/imgHeight;
  
  i = int(xm) + int(xy)*6;
  
  return i;
}

void drawBorder(int i, float imgWidth, float imgHeight){ // draw border of size imgWidth x imgHeight at image index i
  noFill();
  stroke(borderColor);
  strokeWeight(5);
  rect(width*0.1+(imgWidth*(i%6)),height*0.1+(imgHeight*(i/6)),imgWidth,imgHeight);
}

void keyPressed(){
  
    randKey = randomLetter();
  
  if (key == 'r')
    backgroundColor = color(255,0,0);
  else if (key == 'g')
    backgroundColor = color(0,255,0);
  else if (key == 'b')
    backgroundColor = color(0,0,255);
  else if (key == 'y')
    backgroundColor = color(255,250,0);
  else if ( key == 'm')
    backgroundColor = color(255,0,239);
  else if ( key == 'c')
    backgroundColor = color(0,255,259);
  else
    backgroundColor = color(0,0,0);
}

void mouseClicked(){
  float imgWidth = (width/6)*0.8; //size of the images
  float imgHeight = (height/4)*0.8;
  
  cell = getCell(imgWidth,imgHeight);
  int answer = (int)randKey - 65; 
  if(randKey > 'K') 
    answer--;   //fixing index values...
  if(randKey > 'W')
    answer--;
  if(randKey > 'Y')
    answer--;
  
  if(cell == answer)
    borderColor = color(0,255,0);
  else
    borderColor = color(255,0,0);
}

void loadAllImages(){ //load images corresponding to the names in the filenames array
  for(int i = 0; i<filenames.length;i++){
      img[i]=loadImage(filenames[i]);
  }
}


  
void drawAllImages(float imgWidth, float imgHeight){
  int i=0;
      for(float y=height*0.1; y<=height-height/4; y += imgHeight){ //run through all positions depending on the size of the images
        for(float x=width*0.1; x<=width-width/6; x +=imgWidth){
         image(img[i],x,y,imgWidth,imgHeight); 
         i++;
         if(i==img.length)
           break; //break after the last image was printed
        }
      }
    }
