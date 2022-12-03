class Order < ApplicationRecord
  has_many :order_selections
  has_many :entrees, through: :order_selections, source: :orderable, source_type: 'Entree'
  has_many :desserts, through: :order_selections, source: :orderable, source_type: 'Dessert'
  has_many :appetizers, through: :order_selections, source: :orderable, source_type: 'Appetizer'
end
