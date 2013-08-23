
class StatsCalculator

  def self.calculate_median(scores)
    sorted_scores = scores.sort()
    if length_is_even(scores)

    else
      return sorted_scores[scores.length / 2]
    end
  end

  def self.length_is_even(scores)
    scores.length % 2 == 0
  end

end
