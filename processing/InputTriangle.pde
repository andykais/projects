int resolutionX = 900;
int resolutionY = 450;
PVector a, b, c, d, e, f, g, h, j,changer;
//sets up first variable
int randX = (int )(Math.random() * resolutionX + 1);
int randY = (int )(Math.random() * resolutionY + 1);

//max length of 9 points
PVector[] points = new PVector[9];
public boolean inputEndpts = true;
public boolean drawing = true;
//sets number of points
int endpts = 3;
int refreshRate = 1000000;
int i = 0;
String words = "Begin...";

void setup() {
  background(0);
  size(resolutionX, resolutionY);  
  stroke(255, 15);
  //random starting position
  changer = new PVector(randX, randY);
  if (endpts < 4) {
  refreshRate = 200;
  }
  // noLoop();
}

void enterEndpts(int n) {
  background(0);
  endpts = n;
  i = 0;
  inputEndpts = true;
  drawing = true;
  for (int w=0; w<9; ++w)  points[w] = null;

  // loop();
}
void draw() {
  if (mousePressed && inputEndpts) {
    if (i !=endpts) {
      points[i] = new PVector(mouseX,mouseY);
      //makes first points heavy
      for (int w=0; w<20; w++) {
        point(points[i].x,points[i].y);
      }
      mousePressed=false;
      i++;
    }
  }
  if (endpts == i) {drawing = false;}
  if (inputEndpts && !drawing) {
    int oldX = (int )changer.x;
    int oldY = (int )changer.y;
    for (int x=0; x<refreshRate; x++) {
      int choice = choosePts(endpts, endpts);
      if (choice ==endpts-1) {
        //stroke((int )(Math.random() * 255+1),40 ,54, 20);
        changer.x = int((points[choice].x+changer.x)/2);
        changer.y = int((points[choice].y+changer.y)/2); 
        
      }
      else {
       //stroke(100,(int )(Math.random() * 255+1) ,54, 20);
       changer.x = int((points[choice].x+changer.x)/2);
       changer.y = int((points[choice].y+changer.y)/2);   
      }
      point(changer.x, changer.y);
      //line(oldX,oldY,changer.x,changer.y);
    }
    
  }
}

int choosePts(int total, int endpts) {
  int choice = (int )(Math.random() * endpts);
  return choice;
}

void keyPressed() {
  if (key == 's') {
    save("piramid" + endpts + ".tif");
  }
}
