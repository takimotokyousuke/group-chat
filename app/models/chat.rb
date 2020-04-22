class Chat < ApplicationRecord
  belongs_to :group,dependent: :destroy
  belongs_to :user
  has_many :comments 
  has_many :likes,dependent: :destroy
  validates :content,presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
