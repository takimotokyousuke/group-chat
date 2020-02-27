class Chat < ApplicationRecord
  belongs_to :group,:dependent => :destroy
  belongs_to :user,:dependent => :destroy
  has_many :comments 
  validates :content,presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
