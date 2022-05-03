class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {maximum: 255}
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
