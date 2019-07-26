public class Projectile
{
  int pozXProjectile, pozYProjectile;
  float projectileRadius;
  color projectileColor=color(255);
  float projectileSpeedX, projectileSpeedY;
}

public class Brick
{
  int pozX, pozY;
  color brickColor;
  boolean destroyed=false;
}

void declareWall(Brick[][] wall)
{
  for (int i=0; i<brickAmmountWidth; i++)
  {
    for (int j=0; j<brickAmmountHeight; j++)
    {
      wall[i][j]=new Brick();
      wall[i][j].brickColor=color(random(40, 80), 0, random(20, 255), 255);
    }
  }
}

void initializeWall(Brick[][] a)
{
  pushMatrix();
  translate(width/4, 0);
  for (int i=0; i<brickAmmountWidth; i++)
  {
    for (int j=0; j<brickAmmountHeight; j++)
    {
      a[i][j].pozX=i*brickWidth;
      a[i][j].pozY=j*brickHeight;
    }
  }
  popMatrix();
}

void drawBricks(Brick[][] wall)
{
  rectMode(CORNER);
  pushMatrix();
  translate(width/4, 0);
  for (int i=0; i<brickAmmountWidth; i++)
  {
    for (int j=0; j<brickAmmountHeight; j++)
    {
      if (!wall[i][j].destroyed)
      {
        fill(wall[i][j].brickColor, 200);
        rect(wall[i][j].pozX, wall[i][j].pozY, brickWidth, brickHeight,10);
      }
    }
  }
  popMatrix();
}

void drawBrickBackground()
{
  pushMatrix();
  translate(width/2, height/2);
  rectMode(CENTER);
  fill(0, 0, 0, 127);
  rect(0, 0, width/2+100, height, 45);
  popMatrix();
}
