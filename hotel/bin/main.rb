require_relative '../lib/hotel_plugin/hotel_system'

hotel_sys = HotelSystem.new("./lib/hotel_plugin/hotels_config.yml")

File.open("./bin/input_list", "r") do |file|
  while line=file.gets
    puts hotel_sys.find_cheapes_hotel(line)
  end
end
