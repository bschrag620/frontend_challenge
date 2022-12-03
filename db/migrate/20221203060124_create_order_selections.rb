class CreateOrderSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :order_selections do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.references :orderable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
