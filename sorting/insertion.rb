#
# Insertion sort is similar to selection-sort in invariants aspect.
#
# Time Performance:
# O - n^2
# θ - n^2
# Ω - n
# Actually (n^2)/4.
#
# Insertion sort's advantage is that it only scans as many elements as needed
# to determine the correct location of the k+1st element, while selection sort
# must scan all remaining elements to find the absolute smallest element.
#
# Applications:
# - is quick (linear time) for partially sorted arrays.
#
class Insertion

  def sort(data)

    (0...data.size).each do |i|
      i.downto(1).each do |j|
        if data[j] < data[j-1]
          data[j], data[j-1] = data[j-1], data[j]
        else
          break
        end
      end
    end

    data
  end

end