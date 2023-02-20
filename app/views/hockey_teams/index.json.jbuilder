# frozen_string_literal: true

json.array! @hockey_teams, partial: 'hockey_teams/hockey_team', as: :hockey_team
