# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create name: "admin",
  email: "admin@gmail.com",
  password: "1",
  password_confirmation: "1",
  role: 1
User.create name: "duong",
  email: "1@gmail.com",
  password: "1",
  password_confirmation: "1"

Category.create name: "Tieng anh",
  description: "Tieng anh"

Category.create name: "Dong vat",
  description: "Dong vat"

Word.create content: "hello",
  category_id: "1"

Word.create content: "hi",
  category_id: "1"

Word.create content: "nice",
  category_id: "1"

Word.create content: "Shine",
  category_id: "1"

Word.create content: "Find",
  category_id: "1"

Word.create content: "test",
  category_id: "1"

Answer.create word_id: "1",
  is_correct: "true",
  content: "hello"
Answer.create word_id: "1",
  is_correct: "false",
  content: "helo"

Answer.create word_id: "2",
  is_correct: "false",
  content: "hie"
Answer.create word_id: "2",
  is_correct: "true",
  content: "hi"

Answer.create word_id: "3",
  is_correct: "true",
  content: "nice"
Answer.create word_id: "3",
  is_correct: "false",
  content: "nie"

Answer.create word_id: "4",
  is_correct: "false",
  content: "shie"
Answer.create word_id: "4",
  is_correct: "true",
  content: "shine"

Answer.create word_id: "5",
  is_correct: "false",
  content: "fin"

Answer.create word_id: "5",
  is_correct: "true",
  content: "find"

Answer.create word_id: "6",
  is_correct: "false",
  content: "te"
Answer.create word_id: "6",
  is_correct: "true",
  content: "test"

Lesson.create user_id: "2",
  category_id: "1"

Result.create lesson_id: "1",
  word_id: "1",
  answer_id: "1"


40.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "1"
  role = 0
  User.create! name: name, email: email, password: password,
    password_confirmation: password, role: role
end

