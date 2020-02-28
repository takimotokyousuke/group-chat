class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :chats,:dependent => :destroy
  validates :name,presence: true, uniqueness: true

  def show_last_message
    if (last_chat = chats.last).present?
      if last_chat.content?
        last_chat.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません'
    end
  end

end

