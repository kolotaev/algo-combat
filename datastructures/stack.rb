class StackArray
  def initialize
    @storage = []
    @next = nil
    @first = nil
  end

  def push(element)
    @storage[] << element
  end

  def pop
    @storage.last
  end

  def size
    @storage.size
  end

  def empty?
    @storage.empty?
  end
end
