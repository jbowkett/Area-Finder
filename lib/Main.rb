$LOAD_PATH << File.join(File.dirname(__FILE__), "..")

require_relative 'csv_file_aggregator_and_loader'

ActiveRecord::Base.establish_connection(
    :adapter  => "mysql",
    :host     => "localhost",
    :username => "root",
    :password => "",
    :database => "area_finder"
)

input_dir = ARGV[0]

aggregator = CSVFileAggregatorAndLoader.new(input_dir)

aggregator.aggregate


