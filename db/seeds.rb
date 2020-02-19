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
  { title: 'Backend' }
  ])

# admins = Admin.create!([
#  { email: 'evgenymalov76@gmail.com',
#    first_name: 'admin',
#    last_name: 'super',
#    password: '123456',
#    password_confirmation: '123456'},
#  ])

users = User.create!([
  { email: 'ivan@rambler.hn', password: '123456' },
  { email: 'peter@rambler.hn', password: '123456' },
  { email: 'sidor@rambler.hn', password: '123456' }
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
  { body: 'How to include a module in model', test: tests[0] }, #"Module" 
  { body: 'What method removes the last element in an array and returns it?', test: tests[1] },
  { body: 'Which statement is used to define methods that take an unlimited number of arguments?', test: tests[1] },
  { body: 'which ruby on rails application directory contains external modules?', test: tests[3] },
  { body: 'Which ruby on Rails component creates the user interface?', test: tests[3] },
  { body: 'Which group headers, apply a Content-Length?', test: tests[2] },
  { body: 'Which objects return method "where"?', test: tests[5] },
  { body: 'What relationship requires the creation of a join table?', test: tests[6] },
  { body: 'What Does a Controller Do?', test: tests[2] },#"Controller"
  { body: 'Why Use Validations?', test: tests[5] },#"Validations"
  ])

answers = Answer.create!([
  { body: 'Pop', correct: true, question: questions[0] },
  { body: 'Splat', correct: true, question: questions[1] },
  { body: 'lib/', correct: true, question: questions[2] },
  { body: 'View', correct: true, question: questions[3] },
  { body: 'Entity headers', correct: true, question: questions[4] },
  { body: 'Instance of ActiveRecord::Relation', correct: true, question: questions[5] },
  { body: 'Single instance of the model', correct: false, question: questions[5] },
  { body: 'has_many :through', correct: true, question: questions[6] },
  { body: 'has_and_belongs_to_many', correct: false, question: questions[6] },
  { body: 'Will receive the request ', correct: true, question: questions[11] },
  { body: 'Fetch or save data from a model', correct: true, question: questions[11] },
  { body: 'Use a view to create HTML output', correct: true, question: questions[11] },
  { body: 'Makes the model data available to the view', correct: true, question: questions[11] },
  { body: 'To ensure that only valid data is saved into your database', correct: true, question: questions[12] },
  { body: 'By using the include keyword followed by the name of your module', correct: true, question: questions[13] }
  ])

