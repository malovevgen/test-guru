class Badge < ApplicationRecord
  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, :image_name, presence: true
  validates_uniqueness_of :rule, scope: %i[value]
  validates :rule, inclusion: { in: BadgeService::RULES }
end
