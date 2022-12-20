class Api::V1::SubscriptionsController < ApplicationController
  def create
    new_subscription = Subscription.new(subscription_params)
    if new_subscription.save
      render json: SubscriptionSerializer.new(new_subscription), status: 201
    else
      render json: { errors: 'Unable to create subscription. Please try again.' }, status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:subscription_id])
    subscription.update(status: 'cancelled')
    render json: SubscriptionSerializer.new(subscription), status: 200
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end
