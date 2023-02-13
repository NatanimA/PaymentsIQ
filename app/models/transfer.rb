class Transfer < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category, class_name: 'Category'

  validates :name, presence: true
  validates :amount, presence: true, comparison: { greater_than_or_equal_to: 0 }
end
