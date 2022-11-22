class Triangle

  attr_accessor :aSide, :bSide, :cSide
  
  def initialize(aSide,bSide,cSide)
    @aSide = aSide
    @bSide = bSide
    @cSide = cSide
  end

  def kind
    validate_triange
    if (aSide = bSide = cSide)
      :equilateral
    elsif ((aSide = bSide) || (bSide = cSide) || (aSide = cSide))
      :isosceles
    else
      :scalene
    end
  end 

  def sides_greater_than_zero?
    [aSide,bSide,cSide].all?(&:positive?)
  end

  def valid_triangle_inequality?
    aSide + bSide > cSide && aSide + cSide > bSide && bSide + cSide > aSide 
  end

  def validate_triangle
    raise TriangeError unless sides_greater_than_zero && valid_triangle_inequality?
  end

  class TriangeError < StandardError
  end

end
