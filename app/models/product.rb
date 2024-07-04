class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  has_one_attached :image


  validates :name, :price, :stock, presence: true

  def self.ransackable_associations(auth_object = nil)
    %w[category order_items orders]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    %w[id name price stock created_at updated_at]
  end
end
