class Triangle
  attr_accessor :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
    
  end

  def kind
    validate_triangle
    if length1 == length2 && @length2 == length3
    :equilateral
    elsif length1 == length2 || length2 == length3 || length1 == length3
    :isosceles
    else
    :scalene
    end
    

  end

  def valid_side?
    [length1, length2, length3].all?(&:positive?)
  end

  def valid_triangle?
    length1 + length2 > length3 && length2 + length3 > length1 && length3 + length1 > length2
  end

  def validate_triangle
    raise TriangleError unless valid_side? && valid_triangle?
  end




  class TriangleError < StandardError
  end

end
