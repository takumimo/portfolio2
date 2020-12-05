class AddEmojiToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :emoji, :string
  end
end
