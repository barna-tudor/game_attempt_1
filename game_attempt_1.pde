int ball_ammount=75;
void setup()
{
  size(800,600);
  //fullScreen();
  strokeWeight(5);
  initialize(ball_ammount, a);
  font=loadFont("Georgia-Italic-48.vlw");
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
  }
}
void keyPressed()
{
  if(keyCode==SHIFT)
  {
     game_start=false; 
  }
}
