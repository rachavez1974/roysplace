require 'test_helper'

class MenuItemDisplayTest < ActionDispatch::IntegrationTest
  

  def setup
    @admin = users(:nemo)  
  end

  menus = %w[Breakfast Lunch Dinner Latenight Brunch]

  test "test happy hour menu displays correctly" do
    log_in_as(@admin)
    get admin_root_path
    assert_template 'admin/dashboard/home'
    assert_select "a[href=?]", happy_hour_menu_path, count: 2
    get happy_hour_menu_path
    assert_template 'menus/happy_hour_menu'
    assert_match "Happy Hour Menu", response.body
    assert_match "STARTERS", response.body
  end  

  menus.each do |menu|
    menu.downcase!
    test "test #{menu} menu displays correctly" do
      log_in_as(@admin)
      get admin_root_path
      assert_template 'admin/dashboard/home'
      menu_path = "#{menu}_menu_path".to_sym()
      assert_select "a[href=?]", send(menu_path), count: 2
      get send(menu_path)
      template = "menus/#{menu}_menu"  
      assert_template template
      menu.capitalize!
      menu = "Late Night" if menu == "Latenight"
      assert_match "#{menu} Menu", response.body
      assert_match "STARTERS", response.body
      assert_match "Classics", response.body
      assert_match "Dishes", response.body
      assert_match "A LA CARTE", response.body
      assert_match "CONFECTIONS", response.body
    end  
  end

end
