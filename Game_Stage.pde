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
  float brickWidth, brickHeight;
  color brickColor;
  boolean destroyed=false;
}
Brick[][] wall=new Brick[(width/2)/10][(height/4)/3];
void declareWall()
{
  for (int i=0; i<(width/2)/10; i++)
  {
    for (int j=0; j<(height/4)/3; j++)
    {
      wall[i][j]=new Brick();
      wall[i][j].brickWidth=width/2/((width/2)/10);
      wall[i][j].brickHeight=height/4/((height/4)/3);
    }
  }
}
void initializeWall(Brick[][] a)
{
  pushMatrix();
  translate(width/4, 0);
  for (int i=0; i<width/2; i++)
  {
    for (int j=0; j<height/4; j++)
    {
      a[i][j].pozX=i;
      a[i][j].pozX=j;
    }
  }
}
