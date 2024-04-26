5.times do |i|
    User.create(
      name: "User #{i + 1}",
      email: "user#{i + 1}@gmail.com",
      password: "password"
    )
  end


  tags = ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5"]
  tags.each do |tag_name|
    Tag.create(name: tag_name)
  end
  
  users = User.all
  tags = Tag.all
  
  10.times do |i|
    user = users.sample
    post = user.posts.create(
      title: "Post #{i + 1}",
      content: "This is the content of post #{i + 1}",
      published_at: Time.now
    )
    post.tags << tags.sample
  end
  