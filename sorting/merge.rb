#
# Divide and conquer approach.
# Divide array into 2 halves and sort each individually.
# Sorting is done recursively dividing array by half and merging
#
# Can have recursive and non-recursive implementations..
#
# Performance:
# O - NlogN
# θ - NlogN
# Ω - NlogN
#
# Stable? yes
#
# Applications:
# - in many languages is used as a primary sorting implementation
#
class Merge

  def sort(data)
    aux = Array.new(data.size) # create aux array once!
    sorter(data, aux, 0, data.size-1)
    data
  end

  private

  def sorter(data, aux, low, high)
    return if high <= low
    mid = low + (high - low)/2
    sorter(data, aux, low, mid)
    sorter(data, aux, mid+1, high)
    return if data[mid+1] > data[mid] # optimization - stop if already sorted
    merge(data, aux, low, mid, high)
    end

  def merge(a, aux, low, mid, high)
    (low..high).each do |i|
      aux[i] = a[i]
    end
    i, j = low, mid+1
    (low..high).each do |k|
      if i > mid
        a[k], j = aux[j], j+1
      elsif j > high
        a[k], i = aux[i], i+1
      elsif aux[i] < aux[j]
        a[k], i = aux[i], i+1
      else
        a[k], j = aux[j], j+1
      end
    end
  end

end

# Non-recursive merge-sort.
# Can be sometimes little bit slower.
class MergeBottomUp

  def sort(data)
    aux = Array.new(data.size) # create aux array once!
    sz = 1
    while sz < data.size do
      0.step(data.size - sz, sz*2) do |low|
        merge(data, aux, low, low + sz - 1, [low + 2*sz - 1, data.size - 1].min)
      end
      sz *= 2
    end
    data
  end

  private

  # Is the same as for recursive
  def merge(a, aux, low, mid, high)
    (low..high).each do |i|
      aux[i] = a[i]
    end
    i, j = low, mid+1
    (low..high).each do |k|
      if i > mid
        a[k], j = aux[j], j+1
      elsif j > high
        a[k], i = aux[i], i+1
      elsif aux[i] < aux[j]
        a[k], i = aux[i], i+1
      else
        a[k], j = aux[j], j+1
      end
    end
  end

end
