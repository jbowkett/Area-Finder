require_relative  '../app/models/area.rb'

class InputCsvParser
  def parse(file_name)

    f = File.open(file_name)

    areas_map = Hash.new
    line_number = 0

    f.each_line { |line|

      line_number += 1

      next if line_number == 1 || line.strip.length == 0 || line =~ /.*commutefrom.com.*/

      line_segments = line.split ','
      area = line_segments[0]
      avg_house_price = line_segments[1]
      to_train_station = line_segments[2]
      journey_time = line_segments[3]
      changes = line_segments[4]
      frequency = line_segments[5]

      # Add repeated journeys from inout file onto one area
      area_obj = areas_map[area]
      if area_obj == nil

        area_obj = Area.new(area, avg_house_price)

        areas_map[area] = area_obj
      end

      area_obj.add_journey(to_train_station, journey_time, changes, frequency)
    }
    areas_map
  end
end




