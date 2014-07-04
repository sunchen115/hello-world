require 'rspec'
require_relative '../reserv_parser'
describe 'ReservParser' do

  it 'should extract reserv_info valid for valid string' do

    ReservParser.extract_reserv_info('rewards:16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)').should be_valid
  end

  it 'should extract reserv_info not valid for none valid string' do

    ReservParser.extract_reserv_info('rewards16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)').should_not be_valid
  end

end