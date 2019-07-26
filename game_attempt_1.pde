int ball_ammount=75;
Brick[][] wall;
int brickWidth;
int brickHeight;
int brickAmmountWidth;
int brickAmmountHeight;

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
  font=loadFont("Georgia-Italic-64.vlw");
}

void draw()
{
  background(255);
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
  }
}

void keyPressed()
{
  if (keyCode==SHIFT)
  {
    game_start=false;
  }
}
