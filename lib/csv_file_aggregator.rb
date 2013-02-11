require_relative 'input_csv_parser'

class CSVFileAggregator

  def initialize(input_dir)
    @input_dir = input_dir
    ::InputCsvParser.new
  end

  def aggregate
    Dir.foreach(@input_dir) do |file_name|
      next if file_name == '.' || file_name == '..'
      puts "Inspecting :[#{file_name}]..."
      areas = InputCsvParser.new.parse(File.join(@input_dir, file_name))
      puts "Done. #{areas.size}"
    end
  end
end

input_dir = ARGV[0]

aggregator = CSVFileAggregator.new(input_dir)

aggregator.aggregate
