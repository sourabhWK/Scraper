# frozen_string_literal: true

require 'application_system_test_case'

class HockeyTeamsTest < ApplicationSystemTestCase
  setup do
    @hockey_team = hockey_teams(:one)
  end

  test 'visiting the index' do
    visit hockey_teams_url
    assert_selector 'h1', text: 'Hockey teams'
  end

  test 'should create hockey team' do
    visit hockey_teams_url
    click_on 'New hockey team'

    fill_in 'Name', with: @hockey_team.name
    fill_in 'Wins', with: @hockey_team.wins
    click_on 'Create Hockey team'

    assert_text 'Hockey team was successfully created'
    click_on 'Back'
  end

  test 'should update Hockey team' do
    visit hockey_team_url(@hockey_team)
    click_on 'Edit this hockey team', match: :first

    fill_in 'Name', with: @hockey_team.name
    fill_in 'Wins', with: @hockey_team.wins
    click_on 'Update Hockey team'

    assert_text 'Hockey team was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Hockey team' do
    visit hockey_team_url(@hockey_team)
    click_on 'Destroy this hockey team', match: :first

    assert_text 'Hockey team was successfully destroyed'
  end
end
