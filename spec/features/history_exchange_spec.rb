# frozen_string_literal: true

require 'rails_helper'

describe 'Check Currency History' do
  before do
    user = User.create(email: 'ivan@gmail.com', password: '12345678')

    exchange_rate_usd_to_eru = ExchangeRate.create(from: 'USD', to: 'EUR')
    exchange_rate_usd_to_eru.users.append(user)

    HistoryExchangeRate.create(
      amount: '17.535', exchange_rate: exchange_rate_usd_to_eru, created_at: Time.now + 5.minute
    )
    HistoryExchangeRate.create(
      amount: '22.33', exchange_rate: exchange_rate_usd_to_eru, created_at: Time.now + 10.minute
    )
    HistoryExchangeRate.create(
      amount: '8.22', exchange_rate: exchange_rate_usd_to_eru, created_at: Time.now + 1.minute
    )

    exchange_rate_auh_to_eur = ExchangeRate.create(from: 'UAH', to: 'EUR')
    HistoryExchangeRate.create(amount: '11.66', exchange_rate: exchange_rate_auh_to_eur)

    sign_in(user)
  end

  scenario 'Check current exchange rate' do
    visit history_exchange_rates_current_rate_path

    expect(page).to have_content('22.33')
    expect(page).not_to have_content('11.66')
  end

  scenario 'Check currency history' do
    visit history_exchange_rates_path

    expect(page).to have_content('8.22')
    expect(page).to have_content('22.33')
    expect(page).to have_content('17.535')
    expect(page).not_to have_content('11.66')
  end
end
