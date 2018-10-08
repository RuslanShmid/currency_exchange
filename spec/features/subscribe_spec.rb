# frozen_string_literal: true

require 'rails_helper'

describe 'Manage Currency Subscription' do
  before { sign_in }

  scenario 'Subscribe and Unsubscribe to Currency Exchange by User' do
    visit root_path

    click_on 'Create new subscription'

    within 'form' do
      fill_in 'exchange_rate_subscription[from]', with: 'USD'
      fill_in 'exchange_rate_subscription[to]',   with: 'EUR'
      click_on 'Subscribe'
    end

    expect(page).to have_content("You successfully subscribed to 'from: USD, to: EUR'")

    click_on 'delete'

    expect(page).to have_content("Rate 'from: USD to: EUR' destroyed")
  end
end
