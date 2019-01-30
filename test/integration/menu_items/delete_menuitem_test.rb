require 'test_helper'

class DeleteMenuItemTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:nemo)
    @item = menu_items(:one)
  end

  test "unsuccessful delete of menu item" do
    log_in_as(@admin)
    get admin_root_path
    assert_template 'admin/dashboard/home'
    assert_select "a[href=?]", admin_searchmenuitem_path, count: 2
    get admin_searchmenuitem_path 
    assert_template 'menu_items/search_form'
    get admin_item_profile_path, params: { id:  "1" }
    assert_not flash.empty?
    assert_template 'menu_items/search_form'
  end

  test "successful delete of menu item" do
    log_in_as(@admin)
    get admin_root_path
    assert_template 'admin/dashboard/home'
    assert_select "a[href=?]", admin_searchmenuitem_path, count: 2
    get admin_searchmenuitem_path 
    assert_template 'menu_items/search_form'
    get admin_item_profile_path, params: { id:  @item.id }
    assert flash.empty?
    assert_template 'menu_items/show'
    assert_select "a[href=?]", menu_item_path(@item)
    assert_difference 'MenuItem.count', -1 do
    delete menu_item_path(@item)
    end
    assert_redirected_to admin_root_url
  end


end