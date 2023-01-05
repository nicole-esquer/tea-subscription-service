class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    if customer.subscriptions.empty? == false
      render json: CustomerSerializer.new(customer)
    else
      render json: { message: 'This customer has no subscriptions' }
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Invalid customer ID' }, status: 400
  end

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
    if params[:status] == 'cancelled'
      subscription.update_attribute(:status, 1)
      render json: SubscriptionSerializer.new(subscription), status: 200
    elsif params[:status] == 'active'
      subscription.update(subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: 200
    else
      render json: { error: 'Bad request, unable to update' }, status: 400
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Cannot find subscription without ID' }, status: 400
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end
