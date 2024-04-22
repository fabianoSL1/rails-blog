class CreatePostTags < ActiveRecord::Migration[7.1]
  def change
    create_table :post_tags, id: false do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
