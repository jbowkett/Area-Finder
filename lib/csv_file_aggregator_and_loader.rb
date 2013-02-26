require_relative 'input_csv_parser'

class CSVFileAggregatorAndLoader

  def initialize(input_dir)
    @input_dir = input_dir
  end

  def aggregate
    Dir.foreach(@input_dir) do |file_name|
      next if file_name == '.' || file_name == '..'
      puts "Inspecting :[#{file_name}]..."
      areas_map = InputCsvParser.new.parse(File.join(@input_dir, file_name))
      areas_map.each do |key, value|
        value.save
      end
      puts "Done. #{areas_map.size}"
    end
  end
end


