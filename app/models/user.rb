class User < ApplicationRecord
    validates :name, :username, length: {in: 1..25}
    before_validation {name.capitalize!}
    before_validation {username.downcase!}
    validates :email, presence: true, length: {maximum: 255}, uniqueness: true, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation {email.downcase!}
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
    has_many :posts
    mount_uploader :photo, PhotoUploader
    has_many :favorites, dependent: :destroy
end
