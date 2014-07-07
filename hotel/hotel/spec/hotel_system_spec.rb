require 'rspec'
require_relative '../hotel_system'

describe 'HotelSystem' do


  it 'should init by yaml file' do
    htl_sys = HotelSystem.new(File.join(File.dirname(__FILE__),'./hotels_test_config.yml'))
    htl_sys.hotels_list.map{|hotel|hotel.name}.should ==['Lakewood','Bridgewood','Ridgewood']
  end

  it 'should init by hash object' do
    htl_sys = HotelSystem.new({'hotels'=>[
        'name'=>'hotel1_3','rating'=>3,'rewards'=>{'weekendprice'=>10,'weekdayprice'=>20},'regular'=>{'weekendprice'=>10,'weekdayprice'=>20},
    ]})
    htl_sys.hotels_list.map { |hotel| hotel.name}.should == ['hotel1_3']
  end

  it 'should return the cheapest hotel name' do
    htl_sys = HotelSystem.new(File.join(File.dirname(__FILE__),'./hotels_test_config.yml'))
    htl_sys.find_cheapes_hotel('Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)').should == 'Lakewood'
    htl_sys.find_cheapes_hotel('Regular: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)').should == 'Bridgewood'
    htl_sys.find_cheapes_hotel('Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)').should == 'Ridgewood'
  end

end