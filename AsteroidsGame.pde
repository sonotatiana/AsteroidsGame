SpaceShip babySpaceShip = new SpaceShip();
Star [] shootingSky = new Star[150];
Asteroids [] bob = new Asteroids[10];

public void setup() 
{
  size(500,500);
  
  for(int i = 0; i<shootingSky.length; i++)
  {
    shootingSky[i] = new Star();
  }
  
  for(int i = 0; i<bob.length; i++)
  {
    bob[i] = new Asteroids();
  }

}

public void draw() 
{ 
    background(7,58,91);
    babySpaceShip.show();
    babySpaceShip.move();
    
    for(int i = 0;i<shootingSky.length; i++)
    {
      shootingSky[i].show();
    }
    
    for(int i =0; i<bob.length; i++)
    {
      bob[i].show();
      bob[i].move();
    }
}

public void keyPressed()
{
  if(keyCode == RIGHT)
  {
    babySpaceShip.rotate(8);
  }   
  else if(keyCode == LEFT)
  {
    babySpaceShip.rotate(-8);
  }
  else if(keyCode == UP) //acceleration
  {
    babySpaceShip.accelerate(.09);
  }
  else if(keyCode == DOWN) //hyperspace
  {
     babySpaceShip.setDirectionY(0);
     babySpaceShip.setDirectionX(0);
     babySpaceShip.setX((int)(Math.random()*450));
     babySpaceShip.setY((int)(Math.random()*450));
     babySpaceShip.setPointDirection((int)(Math.random()*360));
  }
}

class Star
{
  private int starX, starY,starSize;
  
  public Star()
  {
    starX = (int)(Math.random()*500);
    starY = (int)(Math.random()*500);
    starSize =(int)(Math.random()*4);
  }
  public void show()
  {
    fill(250,250,250);
    ellipse(starX,starY,starSize,starSize);
  }
}

class SpaceShip extends Floater  
{   
   public SpaceShip()
   {
      corners = 6;
      xCorners = new int [corners];
      yCorners = new int [corners];
      xCorners[0] = -6;
      yCorners[0] = -14;
      xCorners[1] = -6;
      yCorners[1] = -2;
      xCorners[2] = -2;
      yCorners[2] = 0;
      xCorners[3] = -6;
      yCorners[3] = 2;
      xCorners[4] = -6;
      yCorners[4] = 14;
      xCorners[5] = 8;
      yCorners[5] = 0;
      myColor = color(131,141,147);
      myCenterX = 250;
      myCenterY = 250;
      myPointDirection = 0;
      myDirectionX = 0;
      myDirectionY = 0;

   }
   
   public void setX(int x){myCenterX = x;}
   public int getX(){return (int)myCenterX;}

   public void setY(int y){myCenterY = y;}
   public int getY(){return (int)myCenterY;}

   public void setDirectionX(double x){myDirectionX = x;}
   public double getDirectionX(){return (double)myDirectionX;}

   public void setDirectionY(double y){myDirectionY = y;}
   public double getDirectionY(){return (double)myDirectionY;}

   public void setPointDirection(int degrees){myPointDirection =degrees;}
   public double getPointDirection(){return (int)myPointDirection;}
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

