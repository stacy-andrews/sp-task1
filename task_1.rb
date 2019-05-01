require 'humanize'

(0..9).each do |method|
  define_method method.humanize do |op=Operation.new|
    p "writing " + method.to_s
    op.apply method
    if op.can_calc?
      return op.calc
    end

    op
  end
end

def times(operation)
  operation.operator = :times
  operation
end

class Operation
  def initialize
    @left = -1
    @right = -1
  end

  attr_accessor :left, :right, :operator

  def calc
    if @operator == :times
      @left * @right
    end
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