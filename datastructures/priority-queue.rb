# Priority Queue is a data type that implies FIFO behaviour.
# Allows to immediately extract min or max element.
#
# Has interface:
# - insert (like enqueue)
# - delete_max (like dequeue)
# - empty?
# - size
#
# Usually is implemented with a binary heap (that uses array underneath).
# For delete_max behaviour use max-binary heap, for get_min - min-binary heap.
# For get_min substitute less to greater in comparison.
#
# Usage:
# - scheduling of processes
# - event-driven simulation
# - monitoring

class PriorityQueue
  def initialize
    @data = Array.new
    @data[0] = nil
  end

  def insert(element)
    @data << element
    sink(@data.last)
  end

  def delete_max
    max = @data[1]
    @data[1], @data[-1] = @data[-1], @data[1]
    sink(1)
    @data.delete_at(-1)
    max
  end

  def size
    @data.size - 1
  end

  def empty?
    size.zero?
  end

  private

  def swim(k)

  end

  def sink(k)

  end
end
