
SpaceShip babySpaceShip = new SpaceShip();

public void setup() 
{
  size(500,500);
}
public void draw() 
{
    babySpaceShip.show();
    babySpaceShip.setX(250);
    babySpaceShip.setY(250);
    babySpaceShip.setDirectionX(3);
    babySpaceShip.setDirectionY(2);
    babySpaceShip.setPointDirection(10);
    babySpaceShip.accelerate(.1);
}

class SpaceShip extends Floater  
{   
   public SpaceShip()
   {
      corners = 6;
      xCorners = new int [corners];
      yCorners = new int [corners];
      xCorners[0] = -3;
      yCorners[0] = -7;
      xCorners[1] = -3;
      yCorners[1] = -1;
      xCorners[2] = -1;
      yCorners[2] = 0;
      xCorners[3] = -3;
      yCorners[3] = 1;
      xCorners[4] = -3;
      yCorners[4] = 7;
      xCorners[5] = 4;
      yCorners[5] = 0;
      myColor = color(0,0,0);
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

public void keyPressed(){
  if(key == RIGHT)
  {
    babySpaceShip.rotate()+=5;
  }   
  else if(key == LEFT)
  {
    babySpaceShip.rotate()-=5;
  }
  else if(key == UP) //acceleration
  {
    babySpaceShip.accelerate();
  }
  else //hyperspace
  {
     babySpaceShip.setY(Math.random() *500);
     babySpaceShip.setX(Math.random() *500);
  }


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

