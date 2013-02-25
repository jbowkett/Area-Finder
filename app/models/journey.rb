require 'active_record'

class Journey < ActiveRecord::Base
  belongs_to :area

  def initialize(destination_station, duration, changes, frequency)
    super(:frequency => frequency, :changes => changes,
         :duration => duration, :destination_station => destination_station
    )

  end
end
