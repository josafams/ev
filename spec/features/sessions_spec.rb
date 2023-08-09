require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  let(:user) {
    User.create(email: 'user@example.com', password: 'password', confirmed_at: Date.today)
  }

  context 'with login aproved' do 
    it "signs me in" do
      visit new_user_session_path
      within("#new_user") do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'
      end
      click_button 'Entrar'
      expect(page).to have_content('Sair')
    end
  end

  context 'with login not aproved' do 
    let(:user_not_aproved) {
      User.create(email: 'user01@example.com', password: 'password')
    }
    
    it "signs me in" do
      visit new_user_session_path
      within("#new_user") do
        fill_in 'Email', with: user_not_aproved.email
        fill_in 'Password', with: 'password'
      end
      click_button 'Entrar'
      expect(page).to have_content('Entrar')
    end
  end
end
