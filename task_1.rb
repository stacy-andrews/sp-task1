require 'humanize'

(0..9).each do |number|
  define_method number.humanize do |op=Operation.new|
    op.apply number
    if op.can_calc?
      return op.calc
    end

    op
  end
end

OPERATIONS = {
  times: lambda { |left, right| left*right },
  plus: lambda { |left, right| left+right }
}

OPERATIONS.each do |key, operation|
  define_method key.to_s do |op|
    op.operator = operation
    op
  end
end

class Operation
  def initialize
    @left = -1
    @right = -1
  end

  attr_accessor :left, :right, :operator

  def calc
    @operator.call @left, @right
  end

  def apply(number)
    if @left == -1
      @left = number

      return
    end

    if @right == -1
      @right = number
    end
  end

  def can_calc?
    @left >=0 && @right >=0
  end
end