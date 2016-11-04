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