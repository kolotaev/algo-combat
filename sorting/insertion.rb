#
# Insertion sort is similar to selection-sort in invariants aspect.
#
# Time Performance:
# O - n^2
# θ - n^2
# Ω - n
# Actually (n^2)/4.
# In Theta almost always outperforms bubble sort and gnome sort.
#
# Makes more exchanges than selection-sort which is bad.
#
# Applications:
# - is quick (linear time)  for partially sorted arrays.
#
class Insertion

  def sort(data)

    (0...data.size).each do |i|
      focus_id = i
      (i-1).downto(0).each do |j|
        if data[focus_id] < data[j]
          data[focus_id], data[j], focus_id = data[j], data[focus_id], j
        else
          break
        end
      end
    end

    data
  end

end