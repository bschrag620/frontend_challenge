class CreateEntrees < ActiveRecord::Migration[7.0]
  def change
    create_table :entrees do |t|
      t.string :name

      t.timestamps
    end

    Entree.create!(name: 'Hamburger')
    Entree.create!(name: 'Pasta')
  end
end
