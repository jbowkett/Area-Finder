
class StatsCalculator

  def self.calculate_median(scores)
    sorted_scores = scores.sort()
    half_length = scores.length / 2
    if length_is_even(scores)
      base_half_length = half_length.to_i
      middle_two_values = [scores[base_half_length], scores[base_half_length +1]]
      return calculate_mean(middle_two_values)
    else
      return sorted_scores[half_length]
    end
  end

  def self.length_is_even(scores)
    scores.length % 2 == 0
  end

  def self.calculate_mean(scores)
    total = scores.inject(0){|score, tally| tally+score}
    return total.to_f/scores.length.to_f
  end

end
