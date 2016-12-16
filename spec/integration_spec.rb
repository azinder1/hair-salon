require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a new stylist route', {:type => :feature}) do
  it('allows a user to add a stylst') do
    visit('/')
    fill_in('first_name', :with => "Edward")
    fill_in('last_name', :with => "Scissorhands")
    click_button('Add a stylist')
    expect(page).to have_content('Edward Scissorhands')
  end
end

describe('add a client route', {:type => :feature}) do
  it('add allows you to assign a client to a stylist') do
    visit('/')
    fill_in('first_name', :with => "Edward")
    fill_in('last_name', :with => "Scissorhands")
    click_button('Add a stylist')
    click_link('Add a Client For the Stylist')
    fill_in('first_name', :with =>"Michael")
    fill_in('last_name', :with =>"Jordan")
    select("Male", :from => "gender")
    click_button("Add Client")
    expect(page).to have_content('Michael Jordan')
  end
end

describe('add a stylist update', {:type => :feature}) do
  it('add allows you to update attributes for a stylist') do
    visit('/')
    fill_in('first_name', :with => "Edward")
    fill_in('last_name', :with => "Scissorhands")
    click_button('Add a stylist')
    click_link('Update')
    fill_in('first_name', :with => "Steve")
    fill_in('last_name', :with => "McQueen")
    click_button("Update Information")
    expect(page).to have_content('Steve McQueen')
  end
end
