Particle [] starLord;
//need to make constants
void setup()
{
	size(800, 800);
	starLord = new Particle[2000];
	for (int i = 0; i < starLord.length-2; ++i) 
	{
		starLord[i] = new NormalParticle();
	}
	starLord[starLord.length -2] = new JumboParticle();
	starLord[starLord.length -1] = new OddballParticle();
}
void draw()
{
	background(0);
	for (int i = 0; i < starLord.length; ++i) 
	{
		starLord[i].move();
		starLord[i].show();
		
	}

}
class NormalParticle implements Particle
{
	double speed, direction, locationY, locationX, bigness;
	NormalParticle()
	{
		speed = (Math.random()*3) ;
		direction = Math.random()*(PI * 2);
		locationX = 400;
		locationY = 400;
		bigness = 2;


	}
	public void move()
	{
		
		if (mousePressed == true) 
		{
			locationX = locationX - Math.cos(direction) * (speed* 6);
			locationY = locationY - Math.sin(direction) * (speed* 6);
			
		}
		else if (locationX > 800 || locationX <0 || locationY >800 || locationY <0) 
		{
			locationX = 400;
			locationY = 400;
			speed = (Math.random()*3) ;
			direction = Math.random()*(PI * 2);
		}
		else 
		{
			locationX = locationX + Math.cos(direction) * speed;
			locationY = locationY + Math.sin(direction) * speed;
		}

	}
	public void show()
	{
		ellipse((float)locationX, (float)locationY, (float)bigness, (float)bigness);

	}
}
interface Particle
{
	public void move();
	
	public void show();
}
class JumboParticle implements Particle
{
	double speed, direction, locationY, locationX, bigness;
	JumboParticle()
	{
		speed = Math.random()*3;
		direction = Math.random()*PI* 2;
		locationX = Math.random()*500;
		locationY= Math.random()*500;
		bigness = 30;

	}
	public void move()
	{
		locationX = locationX + speed;
		locationY = locationY + Math.random() * speed;
		 if (locationX > 800 || locationX <0) 
		{
			speed = -speed;
		}
		if ( locationY >800 || locationY <0) 
		{
			speed = - speed;
		}
	}
	public void show()
	{
		ellipse((float)locationX, (float)locationY, (float)bigness, (float)bigness);

	}
}
class OddballParticle implements Particle
{
	double speed, direction, locationY, locationX, bigness;
	
	OddballParticle()
	{
		speed = (Math.random()*3) ;
		direction = Math.random()*(PI * 2);
		locationX = 400;
		locationY = 400;
		bigness = 2;

	}
	public void move()
	{
		locationX = locationX + speed;
		locationY = locationY + Math.random() * speed;
		 if (locationX > 800 || locationX <0) 
		{
			speed = -speed;
		}
		if ( locationY >800 || locationY <0) 
		{
			speed = - speed;
		}
	}
	public void show()
	{
		fill(255, 0, 0);
		ellipse((float)locationX, (float)locationY, (float)bigness, (float)bigness);
		fill(255);

	}

}


