#read file
require './hotel_system'
hotel_sys = HotelSystem.new

File.open("./input_list", "r") do |file|
  while line=file.gets and line.strip != ''
    puts hotel_sys.find_cheapes_hotel(line)
  end
end