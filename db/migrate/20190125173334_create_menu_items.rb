class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.boolean :availability
      t.integer :section
      t.integer :menu_type

      t.timestamps
    end
  end
end
