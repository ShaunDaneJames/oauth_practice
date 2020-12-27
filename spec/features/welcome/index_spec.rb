require 'rails_helper'

describe 'When I visit the welcome page' do
  it 'has the option to log in with Github' do
    visit '/'

    click_button('Sign In with Github')
  end
end
