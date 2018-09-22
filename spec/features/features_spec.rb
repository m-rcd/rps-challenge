require 'spec_helper'
require './app'

RSpec.feature 'Testing homepage' do
  scenario 'have game title' do
    visit '/'
    expect(page).to have_content 'ROCK PAPER SCISSORS LIZARD SPOCK!'
  end

  scenario 'user can choose 2 players' do
    visit '/'
    expect(page).to have_button('2 players')
  end

  scenario 'user can choose 1 player' do
    visit '/'
    expect(page).to have_button('1 player')
  end
end

RSpec.feature 'Testing solo player' do
  scenario 'player can enter name' do
    visit '/'
    click_button '1 player'
    expect(page).to have_field('player')
  end

  scenario 'player can start the game' do
    visit '/'
    click_button '1 player'
    expect(page).to have_button('Play')
  end

  scenario 'player wins' do
    solo_name_play
    allow_any_instance_of(Array).to receive(:sample).and_return('Paper')
    click_button 'Scissors'
    expect(page).to have_content 'Claudia wins! :D'
  end

  scenario 'computer wins' do
    solo_name_play
    allow_any_instance_of(Array).to receive(:sample).and_return('Paper')
    click_button 'Rock'
    expect(page).to have_content 'Skynet wins! :D'
  end

  scenario 'draw' do
    solo_name_play
    allow_any_instance_of(Array).to receive(:sample).and_return('Paper')
    click_button 'Paper'
    expect(page).to have_content "It's a tie! Try again!"
  end

  scenario 'player can play again' do
    solo_name_play
    click_button 'Paper'
    expect(page).to have_button('Play again')
  end

  scenario 'player can start new game' do
    solo_name_play
    click_button 'Paper'
    expect(page).to have_button('Start new game')
  end
end

RSpec.feature 'testing multiplayer' do
  scenario 'player1 can enter name' do
    visit '/'
    click_button '2 players'
    expect(page).to have_field('player1')
  end

  scenario 'player2 can enter name' do
    visit '/'
    click_button '2 players'
    expect(page).to have_field('player2')
  end

  scenario 'players can start the game' do
    visit '/'
    click_button '2 players'
    expect(page).to have_button('Play')
  end

  scenario 'player1 can choose rock' do
    multi_name_play
    expect(page).to have_button('Rock')
  end

  scenario 'player1 can choose paper' do
    multi_name_play
    expect(page).to have_button('Paper')
  end

  scenario 'player1 can choose scissors' do
    multi_name_play
    expect(page).to have_button('Scissors')
  end

  scenario 'player1 can choose spock' do
    multi_name_play
    expect(page).to have_button('Spock')
  end

  scenario 'player1 can choose lizard' do
    multi_name_play
    expect(page).to have_button('Lizard')
  end

  scenario 'player2 can choose rock' do
    multi_name_play
    click_button 'Paper'
    expect(page).to have_button('Rock')
  end

  scenario 'player2 can choose paper' do
    multi_name_play
    click_button 'Paper'
    expect(page).to have_button('Paper')
  end

  scenario 'player2 can choose scissors' do
    multi_name_play
    click_button 'Paper'
    expect(page).to have_button('Scissors')
  end

  scenario 'player2 can choose spock' do
    multi_name_play
    click_button 'Paper'
    expect(page).to have_button('Spock')
  end

  scenario 'player2 can choose lizard' do
    multi_name_play
    click_button 'Paper'
    expect(page).to have_button('Lizard')
  end

  scenario 'player 1 wins' do
    multi_name_play
    click_button 'Paper'
    click_button 'Rock'
    expect(page).to have_content('Claudia wins! :D')
  end

  scenario 'player 2 wins' do
    multi_name_play
    click_button 'Paper'
    click_button 'Scissors'
    expect(page).to have_content('Marianne wins! :D')
  end

  scenario 'draw' do
    multi_name_play
    click_button 'Paper'
    click_button 'Paper'
    expect(page).to have_content("It's a tie! Try again!")
  end

  scenario 'players can play again' do
    multi_name_play
    click_button 'Paper'
    click_button 'Rock'
    expect(page).to have_button('Play again')
  end

  scenario 'players start new game' do
    multi_name_play
    click_button 'Paper'
    click_button 'Rock'
    expect(page).to have_button('Start new game')
  end
end
