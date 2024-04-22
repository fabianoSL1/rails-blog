class CreatePostsFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :posts_files do |t|

      t.timestamps
    end
  end
end
