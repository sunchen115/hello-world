require 'rspec'
require_relative '../hotel'
require_relative '../reserv_parser'

describe 'Hotel' do

  it 'should init by name and rating' do
    hotel = Hotel.new('htl_name', 3)
    hotel.name.should=='htl_name'
    hotel.rating.should == 3
  end


  it 'should compute price correctly for regular customer and rewards customer' do
  hotel = Hotel.new('test_htl_name',3)
  hotel.set_price_info('regular', 100, 50)
  hotel.set_price_info('rewards', 50 ,25)
  hotel.compute_price(ReservInfo.new('rewards',['sat','mon','tt'])).should == 125
  hotel.compute_price(ReservParser.extract_reserv_info("regular:16Mar2009(sat), 17Mar2009(tues), 18Mar2009(wed)")).should == 250
end

 end
