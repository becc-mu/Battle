def sign_in_and_play
  visit('/')
  fill_in :player_1.name, with: 'Dave'
  fill_in :player_2.name, with: 'Mittens'
  click_button 'Submit'
end
