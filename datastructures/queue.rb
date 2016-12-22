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
    @storage.shift
  end

  def size
    @storage.size
  end

  def empty?
    @storage.empty?
  end
end

# Linked-List implementation of a queue.
# Uses Single-linked list.
class QueueLinkedList
  attr_reader :size

  def initialize
    @start = {}
    @end = {}
    @size = 0
  end

  def enqueue(element)
    old_end = @end
    @end = { data: element, next: {} }
    if empty?
      @start = @end
    else
      old_end[:next] = @end
    end
    @size += 1
  end

  def dequeue
    data = nil
    unless empty?
      data = @start[:data]
      @start = @start[:next]
      @size -= 1
    end
    data
  end

  def empty?
    @start.empty?
  end
end