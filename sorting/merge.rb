#
# Divide and conquer approach.
# Divide array into 2 halves and sort each individually.
# Sorting is done recursive dividing array by half and merging.
#
# Performance:
# O - NlogN
# θ - NlogN
# Ω - NlogN
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
    return data if high <= low
    mid = low + (high - low)/2
    sorter(data, aux, low, mid)
    sorter(data, aux, mid+1, high)
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
