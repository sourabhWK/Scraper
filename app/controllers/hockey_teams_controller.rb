require 'nokogiri'
require 'open-uri'

class HockeyTeamsController < ApplicationController
  before_action :set_hockey_team, only: %i[ show edit update destroy]

  # GET /hockey_teams or /hockey_teams.json
  def scrape 
    url = "https://www.scrapethissite.com/pages/forms/?per_page=100"
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

    redirect_to root_path

  end

  def index
    @hockey_teams = HockeyTeam.all
  end

  # GET /hockey_teams/1 or /hockey_teams/1.json
  def show
  end

  # GET /hockey_teams/new
  def new
    @hockey_team = HockeyTeam.new
  end

  # GET /hockey_teams/1/edit
  def edit
  end

  # POST /hockey_teams or /hockey_teams.json
  def create
    @hockey_team = HockeyTeam.new(hockey_team_params)

    respond_to do |format|
      if @hockey_team.save
        format.html { redirect_to hockey_team_url(@hockey_team), notice: "Hockey team was successfully created." }
        format.json { render :show, status: :created, location: @hockey_team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hockey_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hockey_teams/1 or /hockey_teams/1.json
  def update
    respond_to do |format|
      if @hockey_team.update(hockey_team_params)
        format.html { redirect_to hockey_team_url(@hockey_team), notice: "Hockey team was successfully updated." }
        format.json { render :show, status: :ok, location: @hockey_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hockey_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hockey_teams/1 or /hockey_teams/1.json
  def destroy
    @hockey_team.destroy

    respond_to do |format|
      format.html { redirect_to hockey_teams_url, notice: "Hockey team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hockey_team
      @hockey_team = HockeyTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hockey_team_params
      params.require(:hockey_team).permit(:name, :wins)
    end
end
