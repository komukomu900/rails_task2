class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  belongs_to :user
end