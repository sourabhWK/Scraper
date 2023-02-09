require "test_helper"

class HockeyTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hockey_team = hockey_teams(:one)
  end

  test "should get index" do
    get hockey_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_hockey_team_url
    assert_response :success
  end

  test "should create hockey_team" do
    assert_difference("HockeyTeam.count") do
      post hockey_teams_url, params: { hockey_team: { name: @hockey_team.name, wins: @hockey_team.wins } }
    end

    assert_redirected_to hockey_team_url(HockeyTeam.last)
  end

  test "should show hockey_team" do
    get hockey_team_url(@hockey_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_hockey_team_url(@hockey_team)
    assert_response :success
  end

  test "should update hockey_team" do
    patch hockey_team_url(@hockey_team), params: { hockey_team: { name: @hockey_team.name, wins: @hockey_team.wins } }
    assert_redirected_to hockey_team_url(@hockey_team)
  end

  test "should destroy hockey_team" do
    assert_difference("HockeyTeam.count", -1) do
      delete hockey_team_url(@hockey_team)
    end

    assert_redirected_to hockey_teams_url
  end
end
