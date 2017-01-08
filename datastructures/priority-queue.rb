# Priority Queue is a data type that implies FIFO behaviour.
# Allows to immediately extract min or max element.
#
# Has interface:
# - insert (like enqueue)
# -   (like dequeue)
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
    swim(@data.size-1)
  end

  def delete_max
    max = @data[1]
    @data[1] = @data[-1]
    @data.delete_at(-1)
    sink(1)
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
    while k > 1 && @data[k/2] < @data[k]
      @data[k/2], @data[k] = @data[k], @data[k/2]
      k /= 2
    end
  end

  def sink(k)
    while k*2 < @data.size
      i = k*2
      i += 1 if i < @data.size-1 && @data[i+1] > @data[i]
      break if @data[i] <= @data[k]
      @data[k], @data[i] = @data[i], @data[k]
      k = i
    end
  end
end
