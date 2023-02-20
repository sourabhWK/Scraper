# frozen_string_literal: true

# This is a top level comment for this file
class HockeyTeam < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :wins, presence: true
end
