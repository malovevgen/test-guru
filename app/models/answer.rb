class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_answers_limit, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_limit
    answers_count = question.answers.count
    errors.add(:answers_count, " to a question cannot be more than four") if answers_count >= 4
  end
end
