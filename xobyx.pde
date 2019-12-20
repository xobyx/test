import controlP5.*;

/**
 * Rotate.
 * 
 * Rotating a square around the Z axis. To get the results 
 * you expect, send the rotate function angle parameters that are 
 * values between 0 and PI*2 (TWO_PI which is roughly 6.28). If you prefer to 
 * think about angles as degrees (0-360), you can use the radians() 
 * method to convert your values. For example: scale(radians(90)) 
 * is identical to the statement scale(PI/2).
 */

float angle;
float jitter;
float m=0;
color [] colors={#655643, #80BCA3, #F6F7BD, #E6AC27, #BF4D28};
///
float t1=0;
float t2=0;
float t3=0;
float t4=0;
float t5=0;
float s=0;
int sn=4;
color[] ch;
ControlP5 cp5; 
Slider sd1;
Slider sd2;
Textlabel myTextlabelA;
void setup() {
  //size(720, 1480);

  noStroke();
  fill(255);
  //rectMode(CENTER);
  ch=new color[50];
  for ( int i = 0; i < 50; i++ ) { 
    ch[i]=colors[ int(random( 0, 4 ))];
  }
  fullScreen();
  frameRate(60);
  m=1480/5;
  cp5 = new ControlP5(this); 
  // sd = cp5.addSlider2D("wave").setPosition(30, 40).setSize(100, 100).setMinMax(20, 10, 100, 100).setValue(50, 50);
  sd1=cp5.addSlider("sliderTicks1")
    .setPosition(100, 140)
    .setSize(520, 100)
    .setRange(0, 100)
    .setNumberOfTickMarks(100)
    ;
  sd2=cp5.addSlider("sliderTicks2")
    .setPosition(100, 340)
    .setSize(520, 100)
    .setRange(0, height)
    .setNumberOfTickMarks(height);
    myTextlabelA = cp5.addTextlabel("label") .setText("55555") .setPosition(0,0) .setColorValue(0xff000000) .setFont(createFont("Georgia",120)) ;

  smooth();
}

void draw() {
  //translate(0,-250);

  //shearY(.5);
  //shearX(0.1);
  drawbackground();
}

void drawbackground()
{
  myTextlabelA.setText(str(s));
  pushMatrix();
  fill(#000000);
  float c=sd1.getValue();
  float s1=sd2.getValue();
  
  fill(colors[0]);
  shearY(s1*0.05);
  rect(0, s, width, m);
  fill(colors[1]);
  rect(0, s+m, width, m);

  fill(colors[2]);
  rect(0, s+(m*2), width, m);

  fill(colors[3]);
  rect(0, s+(m*3), width, m);

  fill(colors[4]);
  rect(0, s+(m*4), width, m);

  fill(colors[0]);

  if (s>=height-m)
  {

    rect(0, s-(height), width, m);
  }
  fill(colors[1]);
  if (s>=height-(m*2))
  {

    rect(0, s-(height)+m, width, m);
  }
  fill(colors[2]);
  if (s>=height-(m*3))
  {

    rect(0, s-(height)+(m*2), width, m);
  }
  fill(colors[3]);
  if (s>=height-(m*4))
  {

    rect(0, s-(height)+(m*3), width, m);
  }
  fill(colors[4]);
  if (s>=height-(m*5))
  {

    rect(0, s-(height)+(m*4), width, m);
  }
  s+=c;
  //myTextlabelA.setText(str(s));
  if (s>=height)
  {

    s=0;
  }
  popMatrix();
}
