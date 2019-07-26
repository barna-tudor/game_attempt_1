PFont font;
boolean game_start=false;

void menu_background()
{
  for (int i=0; i<ball_ammount-1; i++)
  {
    for (int j=i+1; j<ball_ammount; j++)
    {
      if (dist(a[i].x, a[i].y, a[j].x, a[j].y)<(width/2+height/2)*0.065)
      {
        stroke(red(lerpColor(a[i].c,a[j].c,0.5)),green(lerpColor(a[i].c,a[j].c,0.5)),blue(lerpColor(a[i].c,a[j].c,0.5)), int(map(dist(a[i].x, a[i].y, a[j].x, a[j].y), 0, (width/2+height/2)*0.065, 200, 0)));
        line(a[i].x, a[i].y, a[j].x, a[j].y);
      }
    }
  }
  for (int i=0; i<ball_ammount; i++)
  {
    noStroke();
    draw_ball(a, i);
    update_ball(a, i);
  }
}

void Draw_Button_BG()
{
  rectMode(CENTER);
  fill(0, 0, 0, 100);
  rect(width/2, height/2, width/4, height/2, 45);
}

void Draw_Play()
{
  pushMatrix();
  translate(width/2, height/2-height/8);
  if (mouseX>width/2-width*10/100/2&&mouseX<width/2+width*10/100/2&&mouseY>height/2-height/8-height*5/100/2&&mouseY<height/2-height/8+height*5/100/2)
  {
    if (mousePressed)
    {
      game_start=true;
    }
    scale(1.5);
  }
  textAlign(CENTER);
  textFont(font, height*5/100);
  fill(60, 0, 100, 130);
  rect(0, 0, width*10/100, height*5/100, 30);
  fill(0, 0, 0, 255);
  text("Play", 0, height*5/100/3.5);
  popMatrix();
}

void Draw_Quit()
{
  pushMatrix();
  translate(width/2, height/2+height/8);
  if (mouseX>width/2-width*10/100/2&&mouseX<width/2+width*10/100/2&&mouseY>height/2+height/8-height*5/100/2&&mouseY<height/2+height/8+height*5/100/2)
  {
    if (mousePressed)
    {
      exit();
    }
    scale(1.5);
  }
  textAlign(CENTER);
  textFont(font, height*5/100);
  fill(60, 0, 100, 130);
  rect(0, 0, width*10/100, height*5/100, 30);
  fill(0, 0, 0, 255);
  text("Quit", 0, height*5/100/3.5);
  popMatrix();
}
