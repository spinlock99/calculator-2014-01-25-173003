class Calculator
  attr_reader :expr

  def expr=(expression)
    if expression.empty?
      expression = "0"
    end
    @expr = expression.split(",").map(&:to_i)
  end

  alias :initialize :expr=

  def add
    return @expr.reduce(:+)
  end

  def diff
    if @expr.length < 2
      raise Exception
    end
    return @expr.reduce(:-)
  end

  def prod
    return @expr.reduce(:*)
  end

  def div
    raise Exception if @expr.include?(0)
    @expr.reduce(:/)
  end
end
