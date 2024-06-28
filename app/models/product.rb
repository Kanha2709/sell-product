class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  has_one_attached :image

  validates :name, :price, :stock, presence: true
end
