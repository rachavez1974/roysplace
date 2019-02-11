require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

WEEK_DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"] 
WEEKEND_DAYS = ["Saturday", "Sunday"]
CURRENT_DAY_OF_WEEK =  DateTime.now.strftime("%A")
T = DateTime.now
CURRENT_DATE= T.day
CURRENT_YEAR = T.year
CURRENT_MONTH = T.month


  test "test layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", '/', count: 3
    assert_select "a[href=?]", menus_path, count: 2
    assert_select "a[href=?]", contact_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", bagged_path
    assert_select "a[href=?]", offers_path
    assert_select "a[href=?]", customer_signup_path
  end

  test "breakfast menu being display according to restaurant hours" do 
    puts "Test should fail during the weekend days and hours" 
    Time.current
    travel_to Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 06, 15, 00).in_time_zone('Eastern Time (US & Canada)')
    get root_path
    assert_template 'static_pages/home'
    assert_match "Breakfast Menu", response.body
  end

  test "lunch menu being display according to restaurant hours" do  
    puts "Test should fail during the weekend days and hours"
    Time.current
    travel_to Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 11, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    get root_path
    assert_template 'static_pages/home'
    assert_match "Lunch Menu", response.body
  end

  test "happy hour menu being display according to restaurant hours" do 
    puts "Test should fail during the weekend days and hours" 
    Time.current
    travel_to Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 16, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    get root_path
    assert_template 'static_pages/home'
    assert_match "Happy Hour Menu, only available in restaurant", response.body
    assert_match "Dinner Menu", response.body
  end

  test "dinner menu being display according to restaurant hours" do  
    Time.current
    travel_to Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 19, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    get root_path
    assert_template 'static_pages/home'
    assert_match "Dinner Menu", response.body
  end

  test "latenight menu being display beaccording to restaurant hours" do  
    Time.current
    travel_to Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 22, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    get root_path
    assert_template 'static_pages/home'
    assert_match "Late Night Menu", response.body
  end

  test "brunch menu being display beaccording to restaurant hours" do 
    puts "Test should fail during the week days and hours" 
    Time.current
    travel_to Time.zone.local(CURRENT_YEAR, CURRENT_MONTH, CURRENT_DATE, 10, 45, 00).in_time_zone('Eastern Time (US & Canada)')
    get root_path
    assert_template 'static_pages/home'
    assert_match "Brunch Menu", response.body
  end



end
