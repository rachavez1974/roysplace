module MenusHelper

WEEK_DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"] 
WEEKEND_DAYS = ["Saturday", "Sunday"]
CURRENT_DAY_OF_WEEK =  DateTime.now.strftime("%A")
T = DateTime.now
CURRENT_DATE= T.day
CURRENT_YEAR = T.year
CURRENT_MONTH = T.month


#Use this time to display latenight menu after the end of current day
START_TIME_NEXTDAY = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 00, 00, 00).in_time_zone('Eastern Time (US & Canada)')
END_TIME_NEXTDAY   = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 02, 00, 00).in_time_zone('Eastern Time (US & Canada)')


  def is_next_day?
    DateTime.now.between?(START_TIME_NEXTDAY, END_TIME_NEXTDAY)
  end
  
  # def breakfast_time?
  #   start_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 06, 00, 00).in_time_zone('Eastern Time (US & Canada)')
  #   end_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 10, 44, 00).in_time_zone('Eastern Time (US & Canada)')
  #   DateTime.now.between?(start_time, end_time) && WEEK_DAYS.include?(CURRENT_DAY_OF_WEEK)
  # end

  # def lunch_time?
  #   start_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 10, 45, 00).in_time_zone('Eastern Time (US & Canada)')
  #   end_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 15, 44, 00).in_time_zone('Eastern Time (US & Canada)')
  #   DateTime.now.between?(start_time, end_time) && WEEK_DAYS.include?(CURRENT_DAY_OF_WEEK)
  # end

  # def happy_hour_time?
  #   start_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 15, 45, 00).in_time_zone('Eastern Time (US & Canada)')
  #   end_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 18, 45, 00).in_time_zone('Eastern Time (US & Canada)')
  #   DateTime.now.between?(start_time, end_time) && WEEK_DAYS.include?(CURRENT_DAY_OF_WEEK)  
  # end

  # def dinner_time?
  #   start_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 15, 45, 00).in_time_zone('Eastern Time (US & Canada)')
  #   end_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 21, 44, 00).in_time_zone('Eastern Time (US & Canada)')
  #   DateTime.now.between?(start_time, end_time)  
  # end

  # def latenight_time?
  #   start_time_today = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 21, 45, 00).in_time_zone('Eastern Time (US & Canada)')
  #   end_time_today = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 23, 59, 59).in_time_zone('Eastern Time (US & Canada)')
  #   DateTime.now.between?(start_time_today, end_time_today) || DateTime.now.between?(START_TIME_NEXTDAY, END_TIME_NEXTDAY)  
  # end

  # def brunch_time?
  #   start_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 8, 45, 00).in_time_zone('Eastern Time (US & Canada)')
  #   end_time = Time.new(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 15, 45, 00).in_time_zone('Eastern Time (US & Canada)')
  #   DateTime.now.between?(start_time, end_time) && WEEKEND_DAYS.include?(CURRENT_DAY_OF_WEEK)
  #end
end
