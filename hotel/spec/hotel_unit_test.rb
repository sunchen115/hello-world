require 'test/unit'
require_relative '../reserv_parser'
require_relative '../hotel'
require_relative '../hotel_system'

class ReservPaserTest < Test::Unit::TestCase

  def test_parse_not_valid
    assert (ReservParser.extract_reserv_info("test_invalid").valid? == false)
  end

  def test_parse_valid
    reservinfo = ReservParser.extract_reserv_info("rewards:16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)")
    assert(reservinfo.valid?)
    assert_equal( "rewards",reservinfo.customer_type, "rewards")
    assert_equal(['mon','tues','wed'],reservinfo.live_time_list)
  end

end

class HotelTest < Test::Unit::TestCase
  def test_hotel_init
    hotel = Hotel.new('test_htl_name',3)
    assert_equal('test_htl_name',hotel.name)
    assert_equal(3,hotel.rating)
  end

  def test_comput_price
    hotel = Hotel.new('test_htl_name',3)
    hotel.set_price_info('regular', 100, 50)
    hotel.set_price_info('rewards', 50 ,25)
    assert_equal(125, hotel.compute_price(ReservInfo.new('rewards',['sat','mon','tt'])))
    assert_equal(250, hotel.compute_price(ReservParser.extract_reserv_info("regular:16Mar2009(sat), 17Mar2009(tues), 18Mar2009(wed)")))
  end
end

class HotelSystemTest < Test::Unit::TestCase
  
  def test_hotel_system_init
    hlt_sys = HotelSystem.new('./hotels_test_config.yml')
    assert_equal( hlt_sys.hotels_list.map{|hotel|hotel.name},['Lakewood','Bridgewood','Ridgewood'])
  end

  def test_find_cheapest_hotel
      hlt_sys = HotelSystem.new('./hotels_test_config.yml')
      assert_equal('Lakewood',hlt_sys.find_cheapes_hotel('Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)'))
      assert_equal('Bridgewood',hlt_sys.find_cheapes_hotel('Regular: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)'))
      assert_equal('Ridgewood',hlt_sys.find_cheapes_hotel('Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)'))
  end

end