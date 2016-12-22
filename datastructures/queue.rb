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
# Uses Double-linked list.
class QueueLinkedList
  attr_reader :size

  def initialize
    @first = {}
    @last = {}
    @size = 0
  end

  def enqueue(element)
    old_last = @last
    @last = {
      data: element,
      prev: @first[:next].nil? ? {} : @first.
      next: @last
    }
    @size += 1
  end

  def dequeue
    data = nil
    unless @first.empty?
      data = @first[:data]
      @size -= 1
    end
    unless @last.empty?
    end
    data
  end

  def empty?
    @first.empty?
  end
end