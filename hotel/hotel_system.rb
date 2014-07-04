require 'yaml'
require_relative './hotel'
require_relative './reserv_parser'


class HotelSystem
  attr_reader :hotels_list

  def initialize(config_file)
    config_info = config_file.class == Hash ? config_file:YAML.load(File.read(config_file))
    @hotels_list =config_info['hotels'].map { |hotel_info| Hotel.new(name=hotel_info['name'],
                                                                     rating=hotel_info['rating']).
        set_price_info('rewards', hotel_info['rewards']['weekdayprice'], hotel_info['rewards']['weekendprice']).
        set_price_info('regular', hotel_info['regular']['weekdayprice'], hotel_info['regular']['weekendprice']) }

  end


  def find_cheapes_hotel(live_str)
    revers_info = ReservParser.extract_reserv_info(live_str)
    if revers_info.valid?
      @hotels_list.sort! { |a, b| (a.compute_price(revers_info)<=>b.compute_price(revers_info)).nonzero? || (b.rating<=>a.rating) }.first.name
    else
      "%s is invalid format" % live_str
    end
  end
end

