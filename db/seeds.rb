# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'HTTP' },
  { title: 'Ruby on Rails' }
  ])

tests = Test.create!([
  { title: 'Module', level: 1, category_id: 1 },
  { title: 'Methods', level: 3, categoriy_id: 1 },
  { title: 'Header', level: 2, category_id: 2 },
  { title: 'Components', level: 1, category_id: 2 },
  { title: 'Controller', level: 2, category_id: 2 }
  ])

questions = Question.create!([
  { body: 'What method removes the last element in an array and returns it?', test_id: 2 },
  { body: 'Which statement is used to define methods that take an unlimited number of arguments?', test_id: 2 },
  { body: 'Which directory contains the external modules for your application?', test_id: 4 },
  { body: 'Which ruby on Rails component creates the user interface?', test_id: 4 },
  { body: 'Which group headers, apply a Content-Length?', test_id: 3 }
  ])




 
