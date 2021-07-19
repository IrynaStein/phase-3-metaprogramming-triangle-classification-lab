class Triangle
  # attr_reader :side, :side1, :side2

  def initialize(side, side1, side2)
    @side = side
    @side1 = side1
    @side2 = side2
  end

  def kind
    self.validate_triangle
    if 
      @side == @side1 && @side1 == @side2
      :equilateral
    elsif @side == @side1 || @side == @side2 || @side1 == @side2
      :isosceles
    else
      @side != @side1 && @side1 != @side2
      :scalene
    end
  end

  def greater_than_zero?
    [@side, @side1, @side2].all? { |side| side > 0 }
  end

  def valid_triangle?
    @side + @side1 > @side2 && @side1 + @side2 > @side && @side2 + @side > @side1
  end

  def validate_triangle
    if !(greater_than_zero? && valid_triangle?)
    raise TriangleError 
    end
  end

  class TriangleError < StandardError
  end
end
