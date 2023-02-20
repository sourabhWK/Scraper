require 'nokogiri'
require 'open-uri'

class HockeyTeamsController < ApplicationController
  before_action :set_hockey_team, only: %i[ show edit update destroy]
  before_action :initialize_scrape_data_object

  def scrape 
    if @scr.scrape
      redirect_to root_path
    end
  end

  def index
    @hockey_teams = HockeyTeam.all
  end

  def show
  end

  def new
    @hockey_team = HockeyTeam.new
  end

  def edit
  end

  def create
    @hockey_team = HockeyTeam.new(hockey_team_params)

    respond_to do |format|
      if @hockey_team.save
        format.html { redirect_to hockey_team_url(@hockey_team), notice: "Hockey team was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hockey_team.update(hockey_team_params)
        format.html { redirect_to hockey_team_url(@hockey_team), notice: "Hockey team was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hockey_team.destroy

    respond_to do |format|
      format.html { redirect_to hockey_teams_url, notice: "Hockey team was successfully destroyed." }
    end
  end

  private
    def set_hockey_team
      @hockey_team = HockeyTeam.find(params[:id])
    end

    def hockey_team_params
      params.require(:hockey_team).permit(:name, :wins)
    end

    def initialize_scrape_data_object
      @scr = ScrapeData.new
    end
end
