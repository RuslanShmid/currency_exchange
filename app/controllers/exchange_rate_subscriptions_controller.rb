class ExchangeRateSubscriptionsController < ApplicationController
  def index
    @exchange_rates = current_user.exchange_rates
  end

  def new; end

  def create
    response = CurrencyExchangeClient.convert(exchange_rate_params)
    if response['error'].zero?
      ex_rate = ExchangeRate.find_or_create_by(exchange_rate_params)
      if current_user.exchange_rates.exists?(ex_rate.id)
        flash[:notice] = t(
          'you_already_subscribed',
          from: exchange_rate_params['from'],
          to: exchange_rate_params['to']
        )
      else
        current_user.exchange_rates.append(ex_rate)
        flash[:success] = t(
          'you_successfully_subscribed',
          from: exchange_rate_params['from'],
          to: exchange_rate_params['to']
        )
      end
      redirect_to exchange_rate_subscriptions_path
    else
      flash[:error] = "Error: #{response['error_message']}"
      render :new
    end
  end

  private

  def exchange_rate_params
    params.require(:exchange_rate_subscription).permit(:from, :to)
  end
end
