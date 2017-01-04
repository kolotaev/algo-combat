#
# Can be always used as a main shuffling algorithm since it's uniformly random.
# Also known as Fisher–Yates shuffle.
#
# Performance:
# O - n
# θ - n
# Ω - n
#
# Applications:
# - gambling.
# - where random lists are needed.
#
class KnuthShuffle

  def shuffle(data)
    (0...data.size).each do |i|
      r = rand(0..i)
      data[i], data[r] = data[r], data[i]
    end
    data
  end

end
