class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :schedule

  validates :name,          presence: true
  validates :explanation,   presence: true
  validates :category_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :schedule_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,         presence: true

  # belongs_to user
  has_one_attached :image

end