boolean game_start=false;
int ball_ammount=75;
Brick[][] wall;
int brickWidth;
int brickHeight;
int brickAmmountWidth;
int brickAmmountHeight;
Projectile bullet=new Projectile();
void setup()
{
  //size(800, 600);
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
    for (int i=0; i<brickAmmountWidth; i++)
    {
      for (int j=0; j<brickAmmountHeight; j++)
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
