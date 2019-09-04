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
  { title: 'Methods', level: 3, category_id: 1 },
  { title: 'Header', level: 2, category_id: 2 },
  { title: 'Components', level: 1, category_id: 2 },
  { title: 'Controller', level: 2, category_id: 2 }
  ])

questions = Question.create!([
  { body: 'What method removes the last element in an array and returns it?', test_id: 2 },
  { body: 'Which statement is used to define methods that take an unlimited number of arguments?', test_id: 2 },
  { body: 'which ruby on rails application directory contains external modules?', test_id: 4 },
  { body: 'Which ruby on Rails component creates the user interface?', test_id: 4 },
  { body: 'Which group headers, apply a Content-Length?', test_id: 3 }
  ])

answers = Answer.create!([
  { body: 'Pop', correct: true, question_id: 1 },
  { body: 'Splat', correct: true, question_id: 2 },
  { body: 'lib/', correct: true, question_id: 3 },
  { body: 'View', correct: true, question_id: 4 },
  { body: 'Entity headers', correct: true, question_id: 5 }
  ])

users = User.create!([
  { name: 'Ivan'},
  { name: 'Peter'},
  { name: 'Sidor'}
  ])

tests_logs = TestsLog.create!([
  { user_id: 1, test_id: 1 },
  { user_id: 2, test_id: 1 },
  { user_id: 1, test_id: 2 },
  { user_id: 2, test_id: 3 },
  { user_id: 1, test_id: 4 },
  { user_id: 2, test_id: 5 },
  { user_id: 3, test_id: 2 },
  { user_id: 3, test_id: 3 }
  ])
