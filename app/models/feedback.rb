class Feedback < ApplicationRecord

  attr_accessor :message

  validates :message, presence: true
end
