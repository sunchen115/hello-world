require './hotel_system'

hotel_sys = HotelSystem.new("./hotels_config.yml")

File.open("./input_list", "r") do |file|
  while line=file.gets
    puts hotel_sys.find_cheapes_hotel(line)
  end
end