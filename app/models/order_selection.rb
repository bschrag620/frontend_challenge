class OrderSelection < ApplicationRecord
  belongs_to :order
  belongs_to :orderable, polymorphic: true
end
