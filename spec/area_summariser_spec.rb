require 'active_record'
require "rspec"
require 'nulldb_rspec'
require 'nulldb/rails'
include NullDB::RSpec::NullifiedDatabase
ActiveRecord::Base.establish_connection :adapter => :nulldb,
                                        :schema  => 'db/schema.rb'

require_relative '../app/models/journey'

describe "Summarisation" do

  puts 'hello'
      puts 'done.'
  let(:journeys) { [] }
  let(:schools)  { [] }
  let(:area)     { double(:area, :journeys => journeys, :schools => schools) }
  context "of journeys" do
    shortest = Journey.new('Euston', 30, 0, 10)
    let(:journeys) { [Journey.new('Euston', 31, 1, 5), shortest, Journey.new('Waterloo', 45, 0, 5)] }
    subject(AreaSummariser)
    it "should choose the shortest journey" do
      area_summary = AreaSummariser.summarise(area)
      area_summary.shortest_journey_duration.should == shortest.duration
      area_summary.shortest_journey_changes.should == shortest.changes
      area_summary.shortest_journey_frequency.should == shortest.frequency
      area_summary.shortest_journey_destination_station.should == shortest.destination_station
    end

  end

  context "for 2 primary schools" do
    it "calculate the median overall overall inspection grade for school effectiveness score" do
      true.should == false
    end
  end
end