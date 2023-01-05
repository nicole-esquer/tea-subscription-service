require 'rails_helper'

RSpec.describe 'Customer Subscription Index' do
  context 'Happy Path' do
    it 'returns all customer subscriptions both active and cancelled' do
      customer = Customer.create!(first_name: 'Tea', last_name: 'Lover', email: 'tealover@mail.com',
                                  address: '123 Boiling Kettle Lane, Tucson, AZ 85705')
      tea = Tea.create!(title: 'Traditional Chai', description: 'Warm, rich spices from India', temperature: 100,
                        brew_time: 3)
      subscription = Subscription.create!(title: 'Flavorful, delicious teas of India', price: 15.50,
                                          frequency: 3, tea_id: tea.id, customer_id: customer.id)

      get "/api/v1/#{customer.id}/subscriptions"
      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to have_key(:data)
    end
  end

  context 'sad path' do
    it 'will return error if customer id cannot be found' do
      get '/api/v1/80/subscriptions'

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(body).to have_key(:error)
      expect(body[:error]).to eq('Invalid customer ID')
    end
  end
end
