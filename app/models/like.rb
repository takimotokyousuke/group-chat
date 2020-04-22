class Like < ApplicationRecord
  belongs_to :chat, counter_cache: :likes_count
  belongs_to :user
end
