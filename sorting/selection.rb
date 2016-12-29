#
# Selection sort is the most trivial sort.
# On the left we have sorted elements, on the right unsorted.
# The first loop moves the right-left-sides-separator.
# The second searches for the minimum element.
#
# Performance:
# O - n^2
# θ - n^2
# Ω - n^2
# Actually (n^2)/2.
# In Theta almost always outperforms bubble sort and gnome sort.
#
# Applications:
# - for small sets it is faster than some other complex algorithms
#
class Selection

  def sort(data)

    (0...data.size).each do |i|
      min_index = i
      (i+1...data.size).each do |j|
        min_index = j if data[j] < data[min_index]
      end
      data[i], data[min_index] = data[min_index], data[i]
    end

    data
  end

end
