class HockeyTeam < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :wins, presence: true
end
