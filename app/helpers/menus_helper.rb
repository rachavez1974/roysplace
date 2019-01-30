module MenusHelper

WEEK_DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"] 
WEEKEND_DAYS = ["Saturday", "Sunday"]
CURRENT_DAY_OF_WEEK =  DateTime.now.strftime("%A")
T = DateTime.now
CURRENT_DATE= T.day
CURRENT_YEAR = T.year
CURRENT_MONTH = T.month

  def breakfast_time?
    start_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 06, 00, 00).in_time_zone('Eastern Time (US & Canada)')
    end_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 10, 44, 00).in_time_zone('Eastern Time (US & Canada)')
    DateTime.now.between?(start_time, end_time) && WEEK_DAYS.include?(CURRENT_DAY_OF_WEEK)
  end

  def lunch_time?
    start_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 10, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    end_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 15, 44, 00).in_time_zone('Eastern Time (US & Canada)')
    DateTime.now.between?(start_time, end_time) && WEEK_DAYS.include?(CURRENT_DAY_OF_WEEK)
  end

  def happy_hour_time?
    start_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 15, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    end_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 18, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    DateTime.now.between?(start_time, end_time) && WEEK_DAYS.include?(CURRENT_DAY_OF_WEEK)  
  end

  def dinner_time?
    start_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 15, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    end_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 21, 44, 00).in_time_zone('Eastern Time (US & Canada)')
    DateTime.now.between?(start_time, end_time)  
  end

  def latenight_time?
    start_time_today = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 21, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    end_time_today = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 23, 59, 59).in_time_zone('Eastern Time (US & Canada)')
    start_time_nextday = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, (CURRENT_DATE + 1), 00, 00, 00).in_time_zone('Eastern Time (US & Canada)')
    end_time_nextday = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, (CURRENT_DATE + 1), 02, 00, 00).in_time_zone('Eastern Time (US & Canada)')
    DateTime.now.between?(start_time_today, end_time_today) || DateTime.now.between?(start_time_nextday, end_time_nextday)
  end

  def brunch_time?
    start_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 8, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    end_time = Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 15, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    DateTime.now.between?(start_time, end_time) && WEEKEND_DAYS.include?(CURRENT_DAY_OF_WEEK)    
  end
end
