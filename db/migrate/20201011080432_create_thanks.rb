class CreateThanks < ActiveRecord::Migration[5.2]
  def change
    create_table :thanks do |t|
      t.references :user, foreign_key: true
      t.references :post_comment, foreign_key: true

      t.timestamps
    end
  end
end
