class ProcessFileJob
  include Sidekiq::Job

  def perform(file_id, user_id)
    post_file = PostsFile.find_by(id: file_id)

    post_file.file_blob.open do |file|

      post = Post.new(user_id: user_id)
      content = ""

      file.read.each_line do |line|

        if line.include?("!!title")
          post.title = line.split("!!title").last.strip!
        end

        if line.include?("!!tags")
          names = line.split("!!tags").last.strip!

          names.split(",").each do |name|
            strip_name = name.strip
            tag = Tag.find_or_create_by(name: strip_name)
            post.tags << tag
          end
        end

        unless line.include?("!!")
          content += line
        end

        if line.include?("!!post")
          post.content = content.strip!
          post.tags.each do |tag|
            puts tag.name
            puts tag.id
          end
          puts post.save

          post = Post.new(user_id: user_id)
          content = ""
        end
      end
    end

    post_file.file.purge
  end
end
