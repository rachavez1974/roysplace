class CreateLunches < ActiveRecord::Migration[5.1]
  def change
    create_table :lunches do |t|
      t.string :name
      t.string :description
      t.float :price, precision: 15, scale: 2
      t.boolean :availability
      t.integer :section

      t.timestamps
    end
  end
end
