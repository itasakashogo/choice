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
