class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :sub_total
      t.decimal :total
      t.decimal :tax_rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
