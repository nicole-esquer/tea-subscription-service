require 'rails_helper'

RSpec.describe 'Update Subscription Status' do
  context 'Happy Path' do
    it 'updates a subscription status from active to cancel' do
      customer = Customer.create!(first_name: 'Tea', last_name: 'Lover', email: 'tealover@mail.com',
                                  address: '123 Boiling Kettle Lane, Tucson, AZ 85705')
      tea = Tea.create!(title: 'Traditional Chai', description: 'Warm, rich spices from India', temperature: 100,
                        brew_time: 3)
      subscription = customer.subscriptions.create!(title: 'Flavorful, delicious teas of India', price: 15.50, frequency: 3, tea_id: tea.id)

      cancelled_subscription_params = {
        subscription_id: subscription.id,
        status: 'cancelled'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      patch "/api/v1/#{customer.id}/subscriptions", headers: headers,
                                                    params: JSON.generate(cancelled_subscription_params)

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
