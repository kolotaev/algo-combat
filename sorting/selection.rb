#
# Selection sort is the most trivial sort.
# Time complexity is O(n^2).
# Actually (n^2)/2.
#
# Applications:
# - only for small sets as a brute force approach.
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
