#
# Modification of bubble sort:
# in addition every time we go backwards to push minimal element to the left;
# it solves rabbits-turtles problem.
#
# Performance:
# O - n^2
# θ - n^2
# Ω - n
#
class Shaker

  def sort(data)

    left, right = 0, data.size-1

    while left <= right
      left.upto(right-1) do |i|
        data[i], data[i+1] = data[i+1], data[i] if data[i] > data[i+1]
      end
      right -= 1
      (right-1).downto(left) do |i|
        data[i], data[i+1] = data[i+1], data[i] if data[i] > data[i+1]
      end
      left += 1
    end

    data
  end

end
