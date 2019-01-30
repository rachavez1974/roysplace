require 'test_helper'

class EditMenuItemTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:nemo)
    @item = menu_items(:one)
    
  end

  test "unsuccessful edits of item via search" do
    log_in_as(@admin)
    get admin_root_path
    assert_template 'admin/dashboard/home'
    assert_select "a[href=?]", admin_searchmenuitem_path, count: 2
    get admin_searchmenuitem_path
    assert_template 'menu_items/search_form'
    #item not found
    get admin_item_profile_path, params: { id:  "1" }
    assert_not flash.empty?
    assert_template 'menu_items/search_form'
    #item found then trying to edit
    get admin_item_profile_path, params: { id:  @item.id }
    assert flash.empty?
    assert_template 'menu_items/show'
    assert_select "a[href=?]", edit_menu_item_path(@item), count: 1 
    get edit_menu_item_path(@item)
    name = "Bagel and Huevos"
    price = 3.99
    patch menu_item_path(@item), params: { menu_item: { name: "",
                                                  description: "",
                                                  price: "",
                                                  availability: "",
                                                  section: ""
                                                }
                                          }

    assert flash.empty?
    assert_template 'menu_items/edit'
    assert_select 'div.alert', "Please review the problems below:"    
   
  end


test "successful edits of item via search" do
    log_in_as(@admin)
    get admin_root_path
    assert_template 'admin/dashboard/home'
    assert_select "a[href=?]", admin_searchmenuitem_path, count: 2
    get admin_searchmenuitem_path
    assert_template 'menu_items/search_form'
    #item not found
    get admin_item_profile_path, params: { id:  "1" }
    assert_not flash.empty?
    assert_template 'menu_items/search_form'
    #item found then trying to edit
    get admin_item_profile_path, params: { id:  @item.id }
    assert flash.empty?
    assert_template 'menu_items/show'
    assert_select "a[href=?]", edit_menu_item_path(@item), count: 1 
    get edit_menu_item_path(@item)
    name = "Bagel and Huevos"
    price = 3.99
    patch menu_item_path(@item), params: { menu_item: { name: name,
                                                  description: @item.description,
                                                  price: price,
                                                  availability: @item.availability,
                                                  section: @item.section,
                                                  menu_type: "Dinner"
                                                }
                                          }

    assert_not flash.empty? 
    assert_redirected_to menu_item_url(@item)
    follow_redirect!
    assert_select "div.alert", "#{name} information has been updated!"
    @item.reload
    assert_equal name, @item.name
    assert_equal price, @item.price    
  end
end