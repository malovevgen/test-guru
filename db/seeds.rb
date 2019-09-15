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

users = User.create!([
  { name: 'Ivan', email: 'ivan@rambler.hn' },
  { name: 'Peter', email: 'peter@rambler.hn' },
  { name: 'Sidor', email: 'sidor@rambler.hn' }
  ])

tests = Test.create!([
  { title: 'Module', level: 1, category: categories[0], author: users[0] },
  { title: 'Methods', level: 3, category: categories[0], author: users[0] },
  { title: 'Header', level: 2, category: categories[1], author: users[0]  },
  { title: 'Components', level: 1, category: categories[2], author: users[0] },
  { title: 'Controller', level: 2, category: categories[2], author: users[0] },
  { title: 'QueryInterface', level: 5, category: categories[2], author: users[0] },
  { title: 'Associations', level: 5, category: categories[2], author: users[0] },
  { title: 'Validations', level: 5, category: categories[2], author: users[0] }
  ])

questions = Question.create!([
  { body: 'What method removes the last element in an array and returns it?', test: tests[1] },
  { body: 'Which statement is used to define methods that take an unlimited number of arguments?', test: tests[1] },
  { body: 'which ruby on rails application directory contains external modules?', test: tests[3] },
  { body: 'Which ruby on Rails component creates the user interface?', test: tests[3] },
  { body: 'Which group headers, apply a Content-Length?', test: tests[2] },
  { body: 'Which objects return method "where"?', test: tests[5] },
  { body: 'What relationship requires the creation of a join table?', test: tests[6] }
  ])

answers = Answer.create!([
  { body: 'Pop', correct: true, question: questions[0] },
  { body: 'Splat', correct: true, question: questions[1] },
  { body: 'lib/', correct: true, question: questions[2] },
  { body: 'View', correct: true, question: questions[3] },
  { body: 'Entity headers', correct: true, question: questions[4].id },
  { body: 'Instance of ActiveRecord::Relation', correct: true, question: questions[5] },
  { body: 'Single instance of the model', correct: false, question: questions[5] },
  { body: 'has_many :through', correct: true, question: questions[6] },
  { body: 'has_and_belongs_to_many', correct: false, question: questions[6] }
  ])

logbooks = Logbook.create!([
  { user: users[0], test: tests[0] },
  { user: users[0], test: tests[1] },
  { user: users[0], test: tests[2] },
  { user: users[1], test: tests[1] },
  { user: users[1], test: tests[2] },
  { user: users[2], test: tests[3] },
  { user: users[2], test: tests[4] },
  { user: users[2], test: tests[4] }
  ])
