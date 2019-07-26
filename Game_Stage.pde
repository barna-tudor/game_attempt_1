public class Projectile
{
  int pozXProjectile, pozYProjectile;
  int projectileRadius;
  color projectileColor=color(255);
  int projectileSpeedX, projectileSpeedY;
}

public class Brick
{
  int pozX, pozY;
  color brickColor;
  boolean destroyed=false;
  boolean open=false;
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
      if (i==brickAmmountWidth-1)
      {
        a[i][j].open=true;
      }
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
        rect(wall[i][j].pozX, wall[i][j].pozY, brickWidth, brickHeight, 10);
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
  rect(0, 0, width/2, height);
  popMatrix();
}
void initializeProjectile(Projectile bullet)
{
  bullet.pozXProjectile=width/2;
  bullet.pozYProjectile=height/2;
  bullet.projectileRadius=brickWidth/4;
  int x=int(random(-4,5));
  while(x==0)
  {
    x=int(random(-4,5));
  }
  bullet.projectileSpeedX=x;
  bullet.projectileSpeedY=bullet.projectileSpeedX;
}
void drawProjectile(Projectile bullet)
{
  fill(255, 255, 255, 255);
  ellipse(bullet.pozXProjectile, bullet.pozYProjectile,2*bullet.projectileRadius, 2*bullet.projectileRadius);
}
void updateProjectile(Projectile bullet)
{
  bullet.pozXProjectile+=bullet.projectileSpeedX;
  bullet.pozYProjectile+=bullet.projectileSpeedY;
  if(bullet.pozXProjectile<width/4+bullet.projectileRadius)
  {
    bullet.pozXProjectile=width/4+bullet.projectileRadius;
    bullet.projectileSpeedX=-bullet.projectileSpeedX;
  }
  if(bullet.pozXProjectile>3*width/4-bullet.projectileRadius)
  {
    bullet.pozXProjectile=3*width/4-bullet.projectileRadius;
    bullet.projectileSpeedX=-bullet.projectileSpeedX;
  }
  if(bullet.pozYProjectile<bullet.projectileRadius)
  {
    bullet.pozYProjectile=bullet.projectileRadius;
    bullet.projectileSpeedY=-bullet.projectileSpeedY;
  }
  
}
boolean projectileHit(float projectileX, float projectileY, float projectileRadius, int brickX, int brickY)
{
  float testX = projectileX;
  float testY = projectileY;

  // which edge is closest?
  if (projectileX < brickX)         testX = brickX;                        // test left edge
  else if (projectileX > brickX+brickWidth) testX = brickX+brickWidth;     // right edge
  if (projectileY < brickY)         testY = brickY;                        // top edge
  else if (projectileY > brickY+brickHeight) testY = brickY+brickHeight;   // bottom edge

  // get distance from closest edges
  float distX = projectileX - testX;
  float distY = projectileY - testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= projectileRadius)
  {
    return true;
  }
  return false;
}
