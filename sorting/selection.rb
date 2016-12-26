#
# Selection sort is the most trivial sort.
#
# Time Performance:
# O - n^2
# ø - n^2
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
