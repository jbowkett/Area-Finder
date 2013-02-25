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
      area = clean_quotes(line_segments[0])
      avg_house_price = line_segments[1]
      #remove quotes
      destination_station = clean_quotes(line_segments[2])
      # turn into number of minutes and remove quotes
      journey_time = duration_in_minutes(clean_quotes(line_segments[3]))
      changes = line_segments[4]
      # remove quotes and "every"
      frequency = duration_in_minutes(remove_every(clean_quotes(line_segments[5])))

      # Add repeated journeys from inout file onto one area
      area_obj = areas_map[area]
      if area_obj == nil

        area_obj = Area.new(area, avg_house_price)

        areas_map[area] = area_obj
      end

      area_obj.add_journey(destination_station, journey_time, changes, frequency)
    }
    areas_map
  end

  #duration = 01:55 => 115 minutes
  def duration_in_minutes(duration)
    time_str = duration.split(':')
    time_str[0].to_i * 60 + time_str[1].to_i
  end

  def remove_every(string)
    string.gsub(/every /,'')
  end

  def clean_quotes(string)
    string.gsub(/\"/, '')
  end
end




