# Stack is a general data-structure that implies FIFO behaviour.
# Has interface:
# - push
# - pop
# - empty?
# - size
#
# Can have several implementations:
# - Array
# - Linked List
#

# Array implementation of a stack.
class StackArray
  def initialize
    @storage = []
  end

  def push(element)
    @storage << element
  end

  def pop
    @storage.delete_at(@storage.size - 1)
  end

  def size
    @storage.size
  end

  def empty?
    @storage.empty?
  end
end

# Linked-List implementation of a stack.
class StackLinkedList
  attr_reader :size

  def initialize
    @first = {}
    @size = 0
  end

  def push(element)
    @first = { data: element, previous: @first.empty? ? {} : @first }
    @size += 1
  end

  def pop
    data = @first[:data]
    unless @first.empty?
      @first = @first[:previous]
      @size -= 1
    end
    data
  end

  def empty?
    @first.empty?
  end
end
