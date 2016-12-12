require "gosu"
require_relative "z_order"
require "./body"

class NbodySimulation < Gosu::Window

  def initialize
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)
    text = open("simulations/planets.txt")
    body = 1
    @bodies = []
    text.each_line do |line|
      if body == 1
        @nbodys = line.to_i
      end
      if body > 2
        if body < @nbodys + 3
          planet = Body.new(line.split(" ")[0].to_f, line.split(" ")[1].to_f, line.split(" ")[2].to_f, line.split(" ")[3].to_f, line.split(" ")[4].to_f, Gosu::Image.new("images/#{line.split()[5]}"), @universesize)
          @bodies.push(planet)
        end
      elsif body == 2
        @universesize = line.to_f
      end
      body += 1
    end
    puts @bodys
  end

  def update
    @bodies.each do |body1|
      @bodies.each do |body2|
        if body1 != body2
          body1.force_x(body2.x, body2.y, body2.mass)
          body1.force_y(body2.x, body2.y, body2.mass)
        end
      end
      body1.accx
      body1.accy
      body1.f0

    end
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @bodies.each do |body|
      body.draw
    end
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    close
  end

end

window = NbodySimulation.new
window.show
