require 'rspec'
require_relative '../lib/stats_calculator'

describe StatsCalculator do

  context 'with 3 values' do
    let(:values) { [5,5,1]}

    it 'should calculate median' do
      StatsCalculator.calculate_median(values).should == 5
    end
  end
end
