class AddCurrentMenuToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_items, :current_menu, :boolean
  end
end
