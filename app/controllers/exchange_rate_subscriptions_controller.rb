# frozen_string_literal: true

class ExchangeRateSubscriptionsController < ApplicationController
  def index
    @exchange_rates = current_user.exchange_rates
  end

  def new; end

  def create
    response = CurrencyExchangeClient.convert(exchange_rate_params)
    if response['error'].zero?
      append_exhnage_rate_to_user
      redirect_to exchange_rate_subscriptions_path
    else
      flash[:error] = "Error: #{response['error_message']}"
      render :new
    end
  end

  def destroy
    rate = current_user.exchange_rates.find(params[:id])
    if current_user.exchange_rates.destroy(rate)
      flash[:success] = t('subscription_destroyed', from: rate['from'], to: rate['to'])
    else
      flash[:error] = t('subscription_does_not_destroyed', from: rate['from'], to: rate['to'])
    end
    redirect_to exchange_rate_subscriptions_path
  end

  private

  def append_exhnage_rate_to_user
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
  end

  def exchange_rate_params
    params.require(:exchange_rate_subscription).permit(:from, :to)
  end
end
