class Item < ApplicationRecord

  validates :name,          presence: true
  validates :explanation,   presence: true
  validates :category_id,   presence: true
  validates :status_id,     presence: true
  validates :fee_id,        presence: true
  validates :prefecture_id, presence: true
  validates :schedule_id,   presence: true
  varidates :price,         presence: true
  validates :user,          presence: true

  # belongs_to user
  has_one_attached :image

end
