class ReservInfo
  attr_reader :customer_type, :live_time_list

  def initialize(custype=nil, live_list=nil)
    @customer_type, @live_time_list=custype, live_list
  end

  def show
    puts "%s:%s" % [@customer_type, @live_time_list.to_s]
  end

  def valid?()
    !(@customer_type.nil? || @live_time_list.nil?)
  end
end

class ReservParser
  def self.extract_reserv_info(live_str)
    begin
      customer_type,custype_livestr = split_custype_live_list(live_str)
      live_time_list = custype_livestr.scan(/.*?\(([^\(\)]*)\),*/).map { |item| item[0] }
      ReservInfo.new(customer_type.downcase, live_time_list)
    rescue  =>errs
      ReservInfo.new()
    end

  end
  def self.split_custype_live_list(live_str)
       live_str.split(":", 2)
  end
end


