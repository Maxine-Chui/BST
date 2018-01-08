class BSTNode

  attr_reader :value
  attr_accessor :left, :right, :parent

  def initialize(value, parent = nil)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end

  def insert(new_value)
    if new_value <= @value
      @left.nil? ? @left = BSTNode.new(new_value, self) : @left.insert(new_value)
    elsif new_value > @value
      @right.nil? ? @right = BSTNode.new(new_value, self) : @right.insert(new_value)
    end
  end

  def remove
    if @value <= @parent.value
      @parent.left = nil
    elsif @value > @parent.value
      @parent.right = nil
    end
  end

  def has_no_children
    !@left && !@right
  end

  def only_child
    @left || @right
  end

end
