SpaceShip babySpaceShip = new SpaceShip();
Star [] shootingSky = new Star[150];
ArrayList <Asteroids> asteroidList; 
ArrayList <Bullet> balazo;
public void setup() 
{
  size(500,500);
  
  for(int i = 0; i<shootingSky.length; i++)
  {
    shootingSky[i] = new Star();
  }
  
  asteroidList = new ArrayList <Asteroids>();
  
  for(int i = 0; i<10; i++)
  {
      asteroidList.add(i, new Asteroids());
  }  

  balazo = new ArrayList <Bullet>();
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

    for(int i = 0; i<asteroidList.size();i++)
    {
      asteroidList.get(i).show();
      asteroidList.get(i).move();

       if(dist((int)asteroidList.get(i).getX(), (int)asteroidList.get(i).getY(), (int)babySpaceShip.getX(), (int)babySpaceShip.getY()) <20)
      {
        asteroidList.remove(i);
      }                                                
    }  
    
    for(int i = 0; i<balazo.size(); i++)
      {
        balazo.get(i).show();
        balazo.get(i).move(); 
        for(int j= 0; j< asteroidList.size(); j++)
        {
          if(dist((int)balazo.get(i).getX(),(int)balazo.get(i).getY(),(int)asteroidList.get(j).getX(), (int)asteroidList.get(j).getY())<5)
          {
            asteroidList.remove(j);
            balazo.remove(i);
            break;
          }
        }
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
  else if(key == ' ')
  {
    balazo.add(new Bullet(babySpaceShip));
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

class Asteroids extends Floater
{
  private int rotationOfAsteroids;
  
  public Asteroids()
  {
    myColor = color(100);
    myCenterX = (int)(Math.random()*450);
    myCenterY = (int)(Math.random()*450);
    myPointDirection = (int)(Math.random()*360);
    myDirectionY = (int)(Math.random()*5)-2;
    myDirectionX = (int)(Math.random()*5)-2;
    rotationOfAsteroids = (int)(Math.random()*3);
    
    corners = 29;
    xCorners = new int [corners];
    yCorners = new int[corners];
    xCorners[0] = -4;
    yCorners[0] = -7;
    xCorners[1] = -3;
    yCorners[1] = -6;
    xCorners[2] = -3;
    yCorners[2] = -7;
    xCorners[3] = -1;
    yCorners[3] = -8;
    xCorners[4] = 2;
    yCorners[4] = -8;
    xCorners[5] = 3;
    yCorners[5] = -7;
    xCorners[6] = 4;
    yCorners[6] = -7;
    xCorners[7] = 5;
    yCorners[7] = -6;
    xCorners[8] = 5;
    yCorners[8] = -5;
    xCorners[9] = 3;
    yCorners[9] = -4;
    xCorners[10] = 4;
    yCorners[10] = -3;
    xCorners[11] = 2;
    yCorners[11] = -1;
    xCorners[12] = 3;
    yCorners[12] = 0;
    xCorners[13] = 2;
    yCorners[13] = 1;
    xCorners[14] = 3;
    yCorners[14] = 2;
    xCorners[15] = 2;
    yCorners[15] = 4;
    xCorners[16] = 1;
    yCorners[16] = 3;
    xCorners[17] = 0;
    yCorners[17] = 4 ;
    xCorners[18] = -1;
    yCorners[18] = 4;
    xCorners[19] = -2;
    yCorners[19] = 3;
    xCorners[20] = -3;
    yCorners[20] = 3;
    xCorners[21] = -4;
    yCorners[21] = 2;
    xCorners[22] = -5;
    yCorners[22] = 3;
    xCorners[23] = -7;
    yCorners[23] = 2;
    xCorners[24] = -7;
    yCorners[24] = 0;
    xCorners[25] = -5;
    yCorners[25] = -2;
    xCorners[26] = -7;
    yCorners[26] = -4;
    xCorners[27] = -5;
    yCorners[27] = -4;
    xCorners[28] = -5;
    yCorners[28] = -6;
  }

  public void move()
  {
    rotate(rotationOfAsteroids);
    super.move();
  }

  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}

  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}

  public void setDirectionX(double x){ myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}

  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}

  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return (int)myPointDirection;}
  
}

class Bullet extends Floater
{
   private double dRadians;
  
  public Bullet(SpaceShip theShip)
  {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
    
  }
  public void show()
  {
    fill(255,77,0);
    ellipse((int)myCenterX, (int)myCenterY,8,8);
  }

  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;      
  }

  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}

  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}

  public void setDirectionX(double x){ myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}

  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}

  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return (int)myPointDirection;}
  

}