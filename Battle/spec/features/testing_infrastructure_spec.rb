#in spec/features/testing_infrastructure_spec.rb
# feature 'Testing infrastructure' do
#   scenario 'Can run app and check page content' do
#     visit('/')
#     expect(page).to have_content 'Testing infrastructure working!'
#   end
# end

# We want to Start a fight by entering our names and seeing them

  feature 'Enter names' do
    scenario 'submitting names' do
      visit('/')
      fill_in :player_1_name, with: 'Dave'
      fill_in :player_2_name, with: 'Mittens'
      click_button 'Submit'
      expect(page).to have_content 'Dave vs. Mittens'
    end
  end
