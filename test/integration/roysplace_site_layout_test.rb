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

  test "right menu being display according to restaurant hours" do
    get root_path
    assert_template 'static_pages/home'
    


  end
end
