boolean game_start=false;
int ball_ammount=75;
Brick[][] wall;
int brickWidth;
int brickHeight;
int brickAmmountWidth;
int brickAmmountHeight;
Projectile bullet=new Projectile();
int padX;
int padY;
int padWidth, padHeight;
void setup()
{
  //size(800, 600);
  fullScreen();
  strokeWeight(5);
  initialize(ball_ammount, a);
  brickAmmountWidth=(width/2)/100;
  brickAmmountHeight=(height/4)/35;
  wall=new Brick[brickAmmountHeight][brickAmmountWidth];
  brickWidth=width/2/brickAmmountWidth;
  brickHeight=height/4/brickAmmountHeight;
  declareWall(wall);
  initializeWall(wall);
  initializeProjectile(bullet);
  font=loadFont("Georgia-Italic-64.vlw");
  padHeight=height/50;
  padWidth=width/15;
  padY=height-int(padHeight*1.5);
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
    updatePad();
    drawPad();
    if (bullet.pozYProjectile<height/3&&bullet.projectileSpeedY<0)
      for (int i=0; i<brickAmmountHeight; i++)
      {
        for (int j=0; j<brickAmmountWidth; j++)
        {
          updateWall(i, j);
        }
      }
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
