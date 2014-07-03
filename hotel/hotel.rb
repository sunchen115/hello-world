require './htl_define'

class Hotel
  include HotelDefine
  attr_accessor :name, :rating, :price_info


  def get_week_type(str_date)
    return (str_date == 'sun' || str_date == 'sat') ? WEEKEND : WEEKDAY
  end

  def initialize(name, rating)
    @name = name
    @rating = rating
    @price_info = {}
  end

  def set_price_info(customer_type, weekday_price, weekend_price)
    @price_info[customer_type]={WEEKDAY => weekday_price, WEEKEND => weekend_price}
  end

  def compute_price(reserv_info)
    return reserv_info.live_time_list.inject(0) { |result, live_time| result + get_detail_price(reserv_info.customer_type, live_time) }
  end

  def get_detail_price(customer_type, live_time)
    @price_info[customer_type][get_week_type(live_time)]
  end

end

