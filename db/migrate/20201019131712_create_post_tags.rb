class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      t.post_id :integer
      t.tag_id :integer

      t.timestamps
    end
  end
end
