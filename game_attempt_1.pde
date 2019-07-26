int ball_ammount=75;
Brick[][] wall;
int brickWidth;
int brickHeight;
int brickAmmountWidth;
int brickAmmountHeight;
Projectile bullet=new Projectile();
void setup()
{
  //size(800,600);
  fullScreen();
  strokeWeight(5);
  initialize(ball_ammount, a);
  brickAmmountWidth=(width/2)/100;
  brickAmmountHeight=(height/4)/35;
  wall=new Brick[brickAmmountWidth][brickAmmountHeight];
  brickWidth=width/2/brickAmmountWidth;
  brickHeight=height/4/brickAmmountHeight;
  declareWall(wall);
  initializeWall(wall);
  initializeProjectile(bullet);
  font=loadFont("Georgia-Italic-64.vlw");
}

void draw()
{
  background(200);
  if (!game_start)
  {
    menu_background();
    Draw_Button_BG();
    Draw_Play();
    Draw_Quit();
  } else
  {
    drawBrickBackground();
    drawBricks(wall);
    drawProjectile(bullet);
    updateProjectile(bullet);
  }
}

void keyPressed()
{
  if (keyCode==SHIFT)
  {
    game_start=false;
    declareWall(wall);
    initializeWall(wall);
    initializeProjectile(bullet);
  }
}
//update wall  : 
//if (wall[i][j].open)
//  {
//    if (projectileHit(wall, bullet.pozXProjectile, bullet.pozYProjectile, bullet.projectileRadius, wall[i][j].pozX, wall[i][j].pozY, i, j))
//    {
//      if (bullet.pozXProjectile<wall[i][j].pozX)
//      {
//        bullet.projectileSpeedX=-bullet.projectileSpeedX;
//      }
//    }
//  }
//wall[i][j].destroyed=true;
//if(i>0)
//{
//  wall[i-1][j].open=true;
//}
//if(j<brickAmmountWidth-1)
//{
//  wall[i][j+1].open=true;
//}
//if(j>0)
//{
//  wall[i][j-1].open=true;
//}
