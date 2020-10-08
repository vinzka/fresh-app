class SportUser < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  validates :skill_level, inclusion: { in: %w[Beginner Intermediate Pro] }
end
