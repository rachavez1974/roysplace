require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  def setup
    @item = MenuItem.new(name: "Chicken Parm", description: "An Italian Classic", 
                     price: 13.95, availability: true, section: "Dishes", menu_type: "Lunch")
  end

  test "menu item should be valid" do
    assert @item.valid?
  end

  test "item's name should be present" do
    @item.name = "  "
    assert_not @item.valid?
  end

  test "item's name should be less than 75 characters" do
    @item.name = "a" * 76
    assert_not @item.valid?
  end

  test "item's description should be present" do
    @item.description = ""
    assert_not @item.valid?
  end

  test "item's description should be less than 500 characters" do
    @item.description = "a" * 501
    assert_not @item.valid?
  end

  test "item's price should be present" do
    @item.price = nil
    assert_not @item.valid?
  end

  test "item's section should be present" do
    sections =  %w[Starters Classics Dishes A_La_Carte Confections]
      sections.each do |s|
        @item.section = s
        assert @item.valid?
      end
  end

  test "item's menu option should be present" do
    menus = %w[Breakfast Lunch Happyhour Dinner Latenight Brunch]
      menus.each do |m|
        @item.menu_type = m
        assert @item.valid?
      end
  end
end
