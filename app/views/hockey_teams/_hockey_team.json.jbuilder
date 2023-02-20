# frozen_string_literal: true

json.extract! hockey_team, :id, :name, :wins, :created_at, :updated_at
json.url hockey_team_url(hockey_team, format: :json)
