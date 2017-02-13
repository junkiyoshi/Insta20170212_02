ArrayList<Particle> particles;

void setup()
{
  size(512, 512);
  frameRate(60);
  colorMode(HSB);
  //blendMode(ADD);

  particles = new ArrayList<Particle>();

  float size = 10;
  boolean flg = false;

  int index = 0;
  for(int y = height / -5; y < height * 1.2; y += size + (size * sqrt(2) / 2))
  {
    for(int x = width / -5; x < width * 1.2; x += size * sqrt(3))
    {
      if(flg)
      {
        particles.add(new Particle(index, x, y, size));
      }
      else
      {
        particles.add(new Particle(index, x + (size * sqrt(3) / 2), y, size));
      }
      index += 1;
    }
    flg = !flg;
  }
}

void draw()
{
  background(0);
  for(Particle p : particles)
  {
    p.run();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 3600)
  {
     exit();
  }
  */
}