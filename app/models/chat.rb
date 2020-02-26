class Chat < ApplicationRecord
  belongs_to :group,:dependent => :destroy
  belongs_to :user,:dependent => :destroy

  validates :content,presence: true, unless: :image?
end
