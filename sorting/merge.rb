#
#
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
    aux = Array.new(data.size)
    sorter(data, aux, 0, data.size-1)
    data
  end

  private

  def sorter(a, aux, lo, hi)
    return if hi <= lo
    mid = lo + (hi - lo)/
  end

  def merge
  end

end
