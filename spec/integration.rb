require('spec_helper')
require('./app')
require('stylist')
require('client')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a new stylist route', {:type => :feature}) do
  it('allows a user to add a stylst') do
    visit('/')
    fill_in('first_name' :with "Edward")
    fill_in('last_name' :with "Scissorhands")
    click_button('')
    expect(page).to have_content('Edward Scissorhands')
  end
end
