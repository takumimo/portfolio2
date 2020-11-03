class RenameCommentIdColumnToThanks < ActiveRecord::Migration[5.2]
  def change
  	rename_column :thanks, :comment_id, :post_comment_id
  end
end
