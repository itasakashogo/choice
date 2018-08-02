User.create!(
    name:    "test",
    email:    "test@example.com",
    password:    "111111",
  )

20.times do |i|
  User.create!(
    name:    "sample#{i}",
    email:    "sample#{i}@gmail.com",
    password:    "111111",
  )
end


3.times do |i|
  Article.create!(
    user_id: 1,
    category_id:1,
    shop_name:    "shop_name#{i}",
    caption:    "caption#{i}",
    store_address:    "store_address#{i}",
  )
end



5.times do |i|
  Article.create!(
    user_id: 1,
    category_id:5,
    shop_name:    "shop_name#{i}",
    caption:    "caption#{i}",
    store_address:    "store_address#{i}",
    genre_list: "ラーメン"
  )
end


articles = []
3.times do |no|
  articles << Article.new(
      user_id: rand(2..10),
    shop_name: Faker::Book.title,
    store_address: Gimei.city.kanji,
    caption: Faker::Lorem.sentences,
    genre_list: "ラーメン",
    category_id: rand(1..10),
  )
end




# Bulk insert

Article.import articles

User.create!(
    name:    "test",
    email:    "test@example.com",
    password:    "111111",
  )


users = []
2.times do |no|
  gimei = Gimei.male
  users << User.new(
    name: gimei.kanji,
    email: Faker::Internet.email,
    password: '111111',
    profile_image: open "#{Rails.root}/app/assets/img/man1.jpg"
  )
end

# Female
2.times do |no|
  gimei = Gimei.female
  users << User.new(
    name: gimei.kanji,
    email: Faker::Internet.email,
    password: '111111',
    profile_image: open "#{Rails.root}/app/assets/img/woman1.jpg"
  )
end


# Bulk insert
User.import users


