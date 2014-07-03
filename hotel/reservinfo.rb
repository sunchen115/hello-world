class ReservInfo
  attr_accessor :customer_type, :live_time_list

  def initialize
    @customer_type=nil
    @live_time_list=nil
  end

  def show
    puts "%s:%s" % [@customer_type, @live_time_list.to_s]
  end

  def extract_live_time(live_str)
    tmp = live_str.split(":", 2)
    tmp.length<2 and return false
    @customer_type = tmp[0].downcase
    live_time_regx =/.*?\(([^\(\)]*)\),*/
    @live_time_list = tmp[1].scan(live_time_regx).collect { |item| item[0].strip}
    #puts @live_time_list
    #.collect { |live_time| live_time.downcase }
    return valid?
  end

  def valid?()
    (@customer_type.nil? || @live_time_list.nil?) and return false
    return true
  end
end