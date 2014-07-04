require './htl_define'
require './hotel'
require './reservinfo'

class HotelFactory
  include HotelDefine

  def self.createHotel(name, rating,regular_price_info,reward_price_info)
    hotel = Hotel.new(name, rating)
    hotel.set_price_info(customer_type = RAGULAR_CUSTOMER, weekday_price = regular_price_info[WEEKDAY], weekend_price = regular_price_info[WEEKEND])
    hotel.set_price_info(customer_type = REWARDS_CUSTOMER, weekday_price = reward_price_info[WEEKDAY], weekend_price = reward_price_info[WEEKEND])
    return hotel
  end
end



class HotelSystem
  include HotelDefine
  attr_accessor :hotels_list

  def initialize()
    @hotels_list = []
    init_default_hotels
  end

  def init_default_hotels()
    @hotels_list<<HotelFactory.createHotel(name="Lakewood", rating=3, regular_price_info = {WEEKDAY=>110, WEEKEND=>90}, reward_price_info={WEEKDAY=>80, WEEKEND=>80})
    @hotels_list<<HotelFactory.createHotel(name="Bridgewood", rating=4, regular_price_info = {WEEKDAY=>160, WEEKEND=>60}, reward_price_info={WEEKDAY=>110, WEEKEND=>50})
    @hotels_list<<HotelFactory.createHotel(name="Ridgewood", rating=5, regular_price_info = {WEEKDAY=>220, WEEKEND=>150}, reward_price_info={WEEKDAY=>100, WEEKEND=>40})
  end


  def find_cheapes_hotel(live_str)
    revers_info = ReservInfo.new
    if revers_info.extract_live_time(live_str)
      return @hotels_list.sort! { |a, b| (a.compute_price(revers_info)<=>b.compute_price(revers_info)).nonzero? || (b.rating<=>a.rating) }[0].name
    else
      return "%s is invalid format" % live_str
    end
  end
end


#find_cheapes_hotel# ss=%q(Regular 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed))
# puts ReservInfo.new.extract_live_time ss
#a = /([^:]+?):(.*?\(.*?\),?)+?/.match(ss)
#a.captures.each{|item| puts (item)}
# regx =/([^,()]+),*/
# regx =/.*?\(([^\(\)]*)\),*/
# ss.scan(regx).each { |x| puts x }x