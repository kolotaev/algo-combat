#
# We pass forward comparing two neighbour elements and swap them: bigger to the right.
# We repeat this passes until the situation when there weren't any swaps - it means array is sorted.
# Bubble - means the heaviest element goes to the right like bubbles go up.
#
# Enhancement is not to go all the way forward so not to touch already heavy elements on the right.
#
# Performance:
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
