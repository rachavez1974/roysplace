require 'test_helper'

class AddMenuItemTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:nemo)  
  end

  test "attempting to add a menu item without admin logged in" do
    get admin_root_path
    assert_template 'admin/dashboard/home'
    get admin_addmenuitem_path
    assert_not flash.empty?
    follow_redirect!
    assert_template 'admin/sessions/new'
    assert_select 'div.alert', "Please log in."
  end

  test "unsuccessful adding of menu item" do
    log_in_as(@admin)
    get admin_root_path
    assert_template 'admin/dashboard/home'
    assert_select "a[href=?]", admin_addmenuitem_path, count: 2
    get admin_addmenuitem_path
    assert_template 'menu_items/new'
    assert_no_difference 'MenuItem.count' do
    post menu_items_path, params: { menu_item: {  name: " ",
                                        description: "",
                                        price: " ",
                                        section: nil,
                                        available: ""
                                    }
                              }
    end
    assert flash.empty?
    assert_template 'menu_items/new'
    assert_select 'div.alert', "Please review the problems below:"    
  end

  test "successful adding of menu item" do
    log_in_as(@admin)
    get admin_root_path
    assert_template 'admin/dashboard/home'
    assert_select "a[href=?]", admin_addmenuitem_path, count: 2
    get admin_addmenuitem_path
    assert_template 'menu_items/new'
    assert_difference 'MenuItem.count', 1 do
    post menu_items_path, params: { menu_item: {  name: "Escargot",
                                        description: "Snail mushrooms",
                                        price: 21.99,
                                        section: "Confections",
                                        availability: true,
                                        menu_type: "Dinner"
                                    }
                              }
    end
 
    assert_not flash.empty?
    follow_redirect! 
    assert_template 'menu_items/show'
  end
end
