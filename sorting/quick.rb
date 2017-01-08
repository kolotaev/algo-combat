#
# Divide and conquer approach.
#
# Performance:
# O - N*logN
# θ - N*logN
# Ω - N*logN
# Doesn't need additional N memory, because does sorting in-place.
#
# Stable? no
#
# Applications:
# - one of the best nowadays.
# - most of the system sort is using it.
#
class Quick

  def sort(data)
    data.shuffle! # is the best way for performance - allows to divide near middle
    sorter(data, 0, data.size-1)
    data
  end

  private

  def sorter(data, low, high)
    return if high <= low
    tie = partition(data, low, high)
    sorter(data, low, tie)
    sorter(data, tie+1, high)
  end

  def partition(data, low, high)
    sample, i, j = data[low], low, high+1

    loop do
      loop do
        i += 1
        break if i == high || data[i] > sample
      end

      loop do
        j -= 1
        break if j == low || data[j] < sample
      end

      break if i >= j
      data[i], data[j] = data[j], data[i]
    end

    data[low], data[j] = data[j], data[low]
    j
  end

end
