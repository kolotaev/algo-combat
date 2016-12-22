# Queue is an abstract data type that implies FIFO behaviour.
# Has interface:
# - enqueue
# - dequeue
# - empty?
# - size
#
# Can have several implementations:
# - Array
# - Linked List
#
# Usage:
# - real queues processing
# - data streams

# Array implementation of a queue.
# Ruby allows the one below, but for more efficient memory/speed use ring-buffer
class QueueArray
  def initialize
    @storage = []
  end

  def enqueue(element)
    @storage << element
  end

  def dequeue
    @storage.delete_at 0
  end

  def size
    @storage.size
  end

  def empty?
    @storage.empty?
  end
end

# Linked-List implementation of a queue.
class QueueLinkedList
  attr_reader :size

  def initialize
    @first = {}
    @last = {}
    @size = 0
  end

  def enqueue(element)

  end

  def dequeue
    data = @first[:data]
    @size -= 1
    data
  end

  def empty?
    @first.empty? && @last.empty?
  end
end