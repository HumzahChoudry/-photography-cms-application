class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :category
  has_many :post_tags
  has_many :tags, through: :post_tags
end