class Feedback
  include ActiveModel::Model

  attr_accessor :email, :message
  #attr_accessor :email

  validates :message, presence: true
end
