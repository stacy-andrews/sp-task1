require 'humanize'

(0..9).each do |number|
  define_method number.humanize do |calculation=Calculation.new|
    calculation.apply number

    return calculation.calc if calculation.can_calc?

    calculation
  end
end

OPERATIONS = {
  times: lambda { |left, right| left*right },
  plus: lambda { |left, right| left+right },
  minus: lambda { |left, right| left-right },
  divided_by: lambda { |left, right| left/right }
}

OPERATIONS.each do |key, operation|
  define_method key.to_s do |op|
    op.apply_operator(operation)
    op
  end
end

class Calculation
  def initialize
    self.left = -1
    self.right = -1
  end

  def calc
    operator.call left, right
  end

  def apply(number)
    return self.right = number if not_set?(right)

    self.left = number if not_set?(left)
  end

  def apply_operator(operation)
    @operator = operation
  end

  def can_calc?
    left >=0 && right >=0
  end

  private

  attr_accessor :left, :right, :operator

  def not_set?(value)
    value == -1
  end
end