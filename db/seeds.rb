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
  { title: 'Module', level: 1, category_id: categories[0].id },
  { title: 'Methods', level: 3, category_id: categories[0].id },
  { title: 'Header', level: 2, category_id: categories[1].id },
  { title: 'Components', level: 1, category_id: categories[2].id },
  { title: 'Controller', level: 2, category_id: categories[2].id },
  { title: 'QueryInterface', level: 5, category_id: categories[2].id },
  { title: 'Associations', level: 5, category_id: categories[2].id },
  { title: 'ScopesValidations', level: 5, category_id: categories[2].id }
  ])

questions = Question.create!([
  { body: 'What method removes the last element in an array and returns it?', test_id: tests[1].id },
  { body: 'Which statement is used to define methods that take an unlimited number of arguments?', test_id: tests[1].id },
  { body: 'which ruby on rails application directory contains external modules?', test_id: tests[3].id },
  { body: 'Which ruby on Rails component creates the user interface?', test_id: tests[3].id },
  { body: 'Which group headers, apply a Content-Length?', test_id: tests[2].id },
  { body: 'Which objects return method "where"?', test_id: tests[5].id },
  { body: 'What relationship requires the creation of a join table?', test_id: tests[6].id }
  ])

answers = Answer.create!([
  { body: 'Pop', correct: true, question_id: questions[0].id },
  { body: 'Splat', correct: true, question_id: questions[1].id },
  { body: 'lib/', correct: true, question_id: questions[2].id },
  { body: 'View', correct: true, question_id: questions[3].id },
  { body: 'Entity headers', correct: true, question_id: questions[4].id },
  { body: 'Instance of ActiveRecord::Relation', correct: true, question_id: questions[5].id },
  { body: 'Single instance of the model', correct: false, question_id: questions[5].id },
  { body: 'has_many :through', correct: true, question_id: questions[6].id },
  { body: 'has_and_belongs_to_many', correct: false, question_id: questions[6].id }
  ])

users = User.create!([
  { name: 'Ivan', email: 'ivan@rambler.hn'},
  { name: 'Peter', email: 'peter@rambler.hn'},
  { name: 'Sidor', email: 'sidor@rambler.hn'}
  ])

logbooks = Logbook.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[1].id, test_id: tests[1].id },
  { user_id: users[1].id, test_id: tests[2].id },
  { user_id: users[2].id, test_id: tests[3].id },
  { user_id: users[2].id, test_id: tests[4].id },
  { user_id: users[2].id, test_id: tests[4].id }
  ])
