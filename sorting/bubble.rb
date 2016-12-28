#
# Is bas
#
# Time Performance:
# O - n^2
# θ - n^2
# Ω - n
#
# Applications:
# - is a training one. Not used in real practice.
#
class Bubble

  def sort(data)

    n = data.size - 1
    loop do
      swapped = FALSE
      (0...n).each do |i|
        data[i], data[i+1], swapped = data[i+1], data[i], TRUE if data[i+1] < data[i]
      end
      n -= 1
      break unless swapped
    end

    data
  end

end
