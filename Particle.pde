class Particle
{
  int index;
  PVector location;
  float radius;
  float hue;
  float saturation; 
  float brightness;
  color body_color;
  
  Particle(int i, float x, float y, float r)
  {
    index = i;
    location = new PVector(x, y);
    radius = r;
    
    hue = 0;
    saturation = 0;
    brightness = 255;
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    hue = (hue + 0.2) % 255;
    
    if(index % 2 == 0)
    {
      saturation = 255 - (location.y / 2 + frameCount) % 255;
      //brightness = 255 - (location.y / 2 + frameCount) % 255;
      body_color = color(hue, saturation, brightness);
    }else
    {
      saturation = 255 - ((height - location.y / 2) + frameCount) % 255;
      //brightness =  255 - ((height - location.y / 2) + frameCount) % 255;
      float tmp_hue = (hue + 128) % 255;
      body_color = color(tmp_hue, saturation, brightness);
    }
  }
  
  void display()
  {
    fill(body_color);
    stroke(255);
    
    pushMatrix();
    translate(location.x, location.y);
        
    beginShape();
    for(int i = 0; i < 360; i += 60)
    {
      float x = radius * cos(radians(i + 90));
      float y = radius * sin(radians(i + 90));
      vertex(x, y);
    }
    endShape(CLOSE);
    
    popMatrix();
  }
}