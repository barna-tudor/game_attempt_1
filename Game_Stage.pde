
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
  for (int i=0; i<brickAmmountHeight; i++)
  {
    for (int j=0; j<brickAmmountWidth; j++)
    {
      wall[i][j]=new Brick();
      wall[i][j].brickColor=color(random(40, 80), 0, random(20, 255), 255);
    }
  }
}

void initializeWall(Brick[][] a)
{
  for (int i=0; i<brickAmmountHeight; i++)
  {
    for (int j=0; j<brickAmmountWidth; j++)
    {
      a[i][j].pozY=i*brickHeight;
      a[i][j].pozX=width/4+j*brickWidth;
      a[i][j].open=false;
      if (i==brickAmmountHeight-1)
      {
        a[i][j].open=true;
      }
    }
  }
}

void drawBricks(Brick[][] wall)
{
  rectMode(CORNER);

  for (int i=0; i<brickAmmountHeight; i++)
  {
    for (int j=0; j<brickAmmountWidth; j++)
    {
      if (!wall[i][j].destroyed)
      {
        fill(wall[i][j].brickColor, 200);
        rect(wall[i][j].pozX, wall[i][j].pozY, brickWidth, brickHeight);
      }
    }
  }
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
  bullet.projectileSpeedX=6;
  bullet.projectileSpeedY=6;
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
boolean projectileHit(float projectileX, float projectileY, float projectileRadius, int brickX, int brickY, float brickWidth, float brickHeight)
{
  float testX = projectileX;
  float testY = projectileY;
  // which edge is closest?
  if (projectileX < brickX)         testX = brickX;                        // test left edge
  else if (projectileX > brickX+brickWidth) testX = brickX+brickWidth;     // right edge
  if (projectileY < brickY)         testY = brickY;                        // top edge
  else if (projectileY > brickY+brickHeight) testY = brickY+brickHeight;   // bottom edge
  float distance = dist(testX, testY, projectileX, projectileY);
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
    if (!wall[i][j].destroyed)
    {
      if (projectileHit(bullet.pozXProjectile, bullet.pozYProjectile, bullet.projectileRadius, wall[i][j].pozX, wall[i][j].pozY, brickWidth, brickHeight))
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
        if (i<brickAmmountHeight-1)
        {
          wall[i+1][j].open=true;
        }
        if (j>0)
        {
          wall[i][j-1].open=true;
        }
        if (j<brickAmmountWidth-1)
        {
          wall[i][j+1].open=true;
        }
      }
    }
  }
}
void updatePad()
{
  padX=constrain(mouseX-padWidth/2, width/4, 3*width/4-padWidth);
  if (bullet.pozYProjectile>height-3*bullet.projectileRadius)
    if (projectileHit(bullet.pozXProjectile, bullet.pozYProjectile, bullet.projectileRadius, padX, padY, padWidth, padHeight))
    {
      bullet.projectileSpeedY=-bullet.projectileSpeedY;
      bullet.pozYProjectile=padY-bullet.projectileRadius;
      if (keyPressed)
      {
        if (key=='w')
        {
          if (bullet.projectileSpeedY>0)
          {
            bullet.projectileSpeedY++;
          } else bullet.projectileSpeedY--;
          if (bullet.projectileSpeedX>0)
          {
            bullet.projectileSpeedX++;
          } else bullet.projectileSpeedX--;
        }
        if (key=='s')
        {
          if (bullet.projectileSpeedY<0)
          {
            bullet.projectileSpeedY++;
          } else bullet.projectileSpeedY--;
          if (bullet.projectileSpeedX<0)
          {
            bullet.projectileSpeedX++;
          } else bullet.projectileSpeedX--;
        }
      }
    }
}

void drawPad()
{
  rect(padX, padY, padWidth, padHeight);
}
