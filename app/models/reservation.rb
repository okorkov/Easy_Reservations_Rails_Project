class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  attr_accessor :checkin_date, :checkin_time, :checkout_date, :checkout_time

  validates_presence_of :checkin_date
  validates_presence_of :checkin_time
  validates_presence_of :checkout_date
  validates_presence_of :checkout_time
  validates_presence_of :number_of_rooms

  def convert_to_datetime
    # binding.pry
    checkin_datetime =  merge_datetime(checkin_date, checkin_time)
    # binding.pry
    checkout_datetime = merge_datetime(checkout_date, checkout_time)
  end

  def merge_datetime(date1, time1)
    # binding.pry
    res_date = Date.parse(date1)
    res_time = Time.parse(time1)
    merged_datetime = DateTime.new(
      res_date.year,
      res_date.month,
      res_date.day,
      res_time.hour,
      res_time.min,
      res_time.sec
    )
  end

  def room_name
    room.room_type.name
  end
end
