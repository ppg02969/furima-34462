class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_fee
    belongs_to :area
    belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :name, length:{ maximum: 40 }
    validates :description, length: { maximum:1000}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000, only_integer: true, message: 'Out of setting range' }, format: { with: /\A[0-9]+\z/, message: 'Half-width number'}
  end
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :area_id
    validates :delivery_day_id
  end
end