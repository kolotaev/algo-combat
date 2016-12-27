#
# Shell sort resembles insertion-sort,
# but we move right-left-separator by series of long paces.
# The series allow to make separate sorted areas (h-sorted)
# remaining less work for the last sort.
# The series depends on the method and the incoming data size.
# OK to use Knuth's 3*n + 1 series function. 1, 4, 7, 10 ...
#
# Time Performance:
# O - N*log^2N or N^5/4 - depends on gaps
# θ - N*log^2N or N^5/4 - depends on gaps
# Ω - N*logN
# Actually .
#
# Insertion sort's advantage is that it only scans as many elements as needed
# to determine the correct location of the k+1st element, while selection sort
# must scan all remaining elements to find the absolute smallest element.
#
# Applications:
# - is quick (linear time) for partially sorted arrays.
#
class Shell

  def sort(data)

    *gaps = 1
    gaps << gaps.last*3 + 1 while gaps.last < data.size/3

    gaps.reverse_each do |h|
      (h...data.size).each do |i| # insertion-sort (but with backwards step -= h)
        i.step(1, -h) do |j|
          if data[j] < data[j-1]
            data[j], data[j-1] = data[j-1], data[j]
          else
            break
          end
        end
      end
    end

    data
  end

end