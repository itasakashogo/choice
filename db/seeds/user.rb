User.create!(
    name:    "test",
    email:    "test@example.com",
    password:    "111111",
  )


5.times do |i|
  gimei = Gimei.female
  User.create!(
    name: gimei.kanji,
    email: Faker::Internet.email,
    password: '111111',
    profile_image: "1.jpg"
  )
end

5.times do |i|
  gimei = Gimei.male
  User.create!(
    name: gimei.kanji,
    email: Faker::Internet.email,
    password: '111111',
    profile_image: "2.jpg"
  )
end