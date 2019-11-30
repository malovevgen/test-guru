class Feedback
  include ActiveModel::Model

  attr_accessor :email, :message
  validates :message, presence: true
end
