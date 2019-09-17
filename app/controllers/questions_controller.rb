class QuestionsController < ApplicationController
    def index
      #render inline: 'List of test questions: <%= @test.questions.pluck(:body) %>'
      #render plain: 'All texts'
      render plain: { tests: Test.all }
    end
end
