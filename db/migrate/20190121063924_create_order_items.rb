class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :orderable, polymorphic: true
      t.references :order, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
