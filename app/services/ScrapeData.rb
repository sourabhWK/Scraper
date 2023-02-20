class ScrapeData
  def initialize
  end

  def scrape 
    url = ENV['URL']
    doc = Nokogiri::HTML5(URI.open(url))

    teams = {}

    doc.css("tr.team").each do |team|
      team_name = team.at(".name").inner_text.strip
      team_wins = team.at(".wins").inner_text.to_i

      teams[team_name] ||= 0
      teams[team_name] += team_wins
    end

    teams.each do |team_name, team_wins|
      HockeyTeam.create(:name => team_name, :wins => team_wins)
    end

    return true

  end
end