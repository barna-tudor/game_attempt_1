boolean pressed;
ball[] a= new ball[ball_ammount];

void mousePressed()
{
  pressed=!pressed;
}

void draw_ball(ball[] a, int i)
{
  fill(a[i].c);
  ellipse(a[i].x, a[i].y, a[i].radius, a[i].radius);
}

void update_ball(ball[] a, int i)
{
  if (a[i].y > height-a[i].radius/2)
  {
    a[i].y=height-a[i].radius/2;
    a[i].speedY=-a[i].speedY;
  }
  if (a[i].y < a[i].radius/2)
  {
    a[i].y=a[i].radius/2;
    a[i].speedY=-a[i].speedY;
  }
  if (a[i].x > width-a[i].radius/2)
  {
    a[i].x=width-a[i].radius/2;
    a[i].speedX=-a[i].speedX;
  }
  if (a[i].x<a[i].radius/2)
  {
    a[i].x=a[i].radius/2;
    a[i].speedX=-a[i].speedX;
  }
  a[i].x+=a[i].speedX;
  a[i].y+=a[i].speedY;
}

void initialize(int ball_ammount, ball[] a)
{
  for (int i=0; i<ball_ammount; i++)
  {
    a[i]=new ball();
  }
  for (int i=0; i<ball_ammount; i++)
  {
    a[i].radius=random(20, 40);
    a[i].x=random(a[i].radius+1, width-a[i].radius-1);
    a[i].y=random(a[i].radius+1, height-a[i].radius-1);
    a[i].speedX=random(-3, 3);
    a[i].speedY=random(-3, 3);
    a[i].c=color(random(30,80), 0, random(50,120), 120);
  }
}

public class ball {
  float x, y;
  float radius;
  float speedX, speedY;
  color c;
}
