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
    sorter(data, 0, data.size-1)
    data
  end

  private

  def sorter(data, low, high)

  end

end
