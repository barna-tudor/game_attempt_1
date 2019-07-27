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
      a[i][j].open=false;
      if (j==brickAmmountHeight-1)
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
  bullet.projectileRadius=brickWidth/8;
  int x=int(random(-4, 5));
  while (x==0)
  {
    x=int(random(-4, 5));
  }
  bullet.projectileSpeedX=x;
  x=int(random(-4, 5));
  while (x==0)
  {
    x=int(random(-4, 5));
  }
  bullet.projectileSpeedY=x;
}
void drawProjectile(Projectile bullet)
{
  fill(255, 255, 255, 255);
  ellipse(bullet.pozXProjectile, bullet.pozYProjectile, 2*bullet.projectileRadius, 2*bullet.projectileRadius);
}
void updateProjectile(Projectile bullet)
{
  bullet.pozXProjectile+=bullet.projectileSpeedX;
  bullet.pozYProjectile+=bullet.projectileSpeedY;
  if (bullet.pozXProjectile<width/4+bullet.projectileRadius)
  {
    bullet.pozXProjectile=width/4+bullet.projectileRadius;
    bullet.projectileSpeedX=-bullet.projectileSpeedX;
  }
  if (bullet.pozXProjectile>3*width/4-bullet.projectileRadius)
  {
    bullet.pozXProjectile=3*width/4-bullet.projectileRadius;
    bullet.projectileSpeedX=-bullet.projectileSpeedX;
  }
  if (bullet.pozYProjectile<bullet.projectileRadius)
  {
    bullet.pozYProjectile=bullet.projectileRadius;
    bullet.projectileSpeedY=-bullet.projectileSpeedY;
  }
  if (bullet.pozYProjectile>height-bullet.projectileRadius)
  {
    game_start=false;
    declareWall(wall);
    initializeWall(wall);
    initializeProjectile(bullet);
  }
  //bullet.pozXProjectile=mouseX;
  //bullet.pozYProjectile=mouseY;
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
  float distance = dist(testX,testY,projectileX,projectileY);
  if (distance <= projectileRadius)
  {
    return true;
  }
  return false;
}
void updateWall(int i, int j)
{
  if (wall[i][j].open)
  {
    if (projectileHit(bullet.pozXProjectile, bullet.pozYProjectile, bullet.projectileRadius, wall[i][j].pozX, wall[i][j].pozY))
    {
      if (bullet.pozXProjectile<wall[i][j].pozX && bullet.projectileSpeedX>0 || bullet.pozXProjectile>wall[i][j].pozX+brickWidth && bullet.projectileSpeedX<0)
      {
        bullet.projectileSpeedX=-bullet.projectileSpeedX;
      }
      if (bullet.pozYProjectile<wall[i][j].pozY && bullet.projectileSpeedY>0 || bullet.pozXProjectile>wall[i][j].pozY+brickHeight && bullet.projectileSpeedY<0)
      {
        bullet.projectileSpeedY=-bullet.projectileSpeedY;
      }
      wall[i][j].destroyed=true;
      if (i>0)
      {
        wall[i-1][j].open=true;
      }
      if (j<brickAmmountHeight-1)
      {
        wall[i][j+1].open=true;
      }
      if (j>0)
      {
        wall[i][j-1].open=true;
      }
    }
  }
}
