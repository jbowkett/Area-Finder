
class StatsCalculator

  def self.calculate_median(values)
    values.compact!
    sorted_scores = values.sort()
    half_length = values.length / 2
    if values.length.even?
      middle_two_values = [values[half_length], values[half_length +1]]
      return calculate_mean(middle_two_values)
    else
      return sorted_scores[half_length]
    end
  end

  def self.length_is_even(values)
    values.length % 2 == 0
  end

  def self.calculate_mean(values)
    values.compact!
    return 0 if values.length == 0
    total = values.inject(0){|score, tally| tally + score}
    return total.to_f/values.length.to_f
  end

end
