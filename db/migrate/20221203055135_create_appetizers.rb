class CreateAppetizers < ActiveRecord::Migration[7.0]
  def change
    create_table :appetizers do |t|
      t.string :name

      t.timestamps
    end

    Appetizer.create!(name: 'Breadsticks')
    Appetizer.create!(name: 'Buffalo wings')
    Appetizer.create!(name: 'Chips and dip')
  end
end
