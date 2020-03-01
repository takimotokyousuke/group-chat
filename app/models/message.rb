class Message < ApplicationRecord
  belongs_to :group
  def self.search(search)
  if search
    Group.where('name LIKE ?',"#{search}")
  else
    Group.all 
  end
end
