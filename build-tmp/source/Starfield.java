import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Starfield extends PApplet {

Particle [] starLord;
//need to make constants
public void setup()
{
	size(800, 800);
	starLord = new Particle[2000];
	for (int i = 0; i < starLord.length-1; ++i) 
	{
		starLord[i] = new NormalParticle();
	}
	starLord[starLord.length -1] = new OddballParticle();
}
public void draw()
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
class OddballParticle implements Particle
{
	double speed, direction, locationY, locationX, bigness;
	OddballParticle()
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


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Starfield" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
