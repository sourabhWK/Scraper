# frozen_string_literal: true

# This is a top level comment for this file
class ScrapeData
  def initialize; end

  def scrape
    doc = Nokogiri::HTML5(URI.parse(ENV['URL']).open)

    teams = {}

    doc.css('tr.team').each do |team|
      team_name = team.at('.name').inner_text.strip
      team_wins = team.at('.wins').inner_text.to_i

      teams[team_name] ||= 0
      teams[team_name] += team_wins
    end

    save_data_to_database(teams)

    true
  end

  def save_data_to_database(teams)
    teams.each do |team_name, team_wins|
      HockeyTeam.create(name: team_name, wins: team_wins)
    end
  end
end
