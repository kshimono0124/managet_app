# メインのサンプルユーザーを1人作成する
User.create!(name:  "guest",
             email: "guest@guest.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# 追加のユーザーをまとめて生成する
30.times do |n|
  name  = Faker::Name.name
  email = "#{n+1}@guest.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# メインのサンプルユーザーを1人作成する
Client.create!(company:  "タロウ株式会社",
             name: "田中太郎",
             phonenumber: "090-9999-9999",
             email: "taro@example.com",
             content: "キャッチコピー、会社情報などを入力してください。")

# 追加のユーザーをまとめて生成する
99.times do |n|
  company = Faker::Company.name
  name  = Faker::Name.name
  phonenumber = Faker::PhoneNumber.cell_phone
  email = "#{n+1}@example.com"
  content = Faker::Company.catch_phrase
  Client.create!(company:  company,
               name: name,
               phonenumber: phonenumber,
               email: email,
               content: content)
end