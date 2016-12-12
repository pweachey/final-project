require "gosu"

class Body

  def initialize (x, y, velocityx, velocityy, mass, image, universesize)
    @x = x
    @y = y
    @velocityx = velocityx
    @velocityy = velocityy
    @mass = mass
    @image = image
    @universesize = universesize
    @forcex = 0
    @forcey = 0
    @G = 6.674e-11
  end

  attr_reader :x, :y, :velocityx, :velocityy, :forcex, :forcey, :mass, :image

  def force_x(px, py, mass)
    force = (@G * mass * @mass) / ((@x - px)**2 + (@y - py)**2)
    @forcex -= force * ((@x - px) / Math.sqrt(((@x - px)**2 + (@y - py)**2)))
  end

  def force_y(px, py, mass)
    force = (@G * mass * @mass) / ((@x - px)**2 + (@y - py)**2)
    @forcey -= force * ((@y - py) / Math.sqrt(((@x - px)**2 + (@y - py)**2)))
  end

  def accx
    acc = @forcex/@mass
    @velocityx += acc * 25000
    @x += @velocityx *25000
  end

  def accy
    acc = @forcey/@mass
    @velocityy += acc * 25000
    @y += @velocityy *25000
  end

  def f0
    @forcex = 0
    @forcey = 0
  end

  def draw
    @image.draw((@x/@universesize)*320 + (640/2) - @image.width/2, (@y/@universesize)*320 + (640/2) - @image.height/2, 1)

  end

end
