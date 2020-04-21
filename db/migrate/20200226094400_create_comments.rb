class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :chat_id
      t.text :content
      t.text :image
      t.timestamps
    end
  end
end
