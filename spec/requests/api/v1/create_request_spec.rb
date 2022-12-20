require 'rails_helper'

RSpec.describe 'Create new Subscriptions' do
  context 'Happy Path' do
    it 'creates a new subscription' do
      customer = Customer.create!(first_name: 'Tea', last_name: 'Lover', email: 'tealover@mail.com',
                                  address: '123 Boiling Kettle Lane, Tucson, AZ 85705')
      tea = Tea.create!(title: 'Traditional Chai', description: 'Warm, rich spices from India', temperature: 100,
                        brew_time: 3)

      subscription_params = {
        title: 'Flavorful, delicious teas of India',
        price: 15.50,
        frequency: 3,
        tea_id: tea.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      post "/api/v1/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription_params)

      expect(response).to be_successful
      expect(response).to have_http_status(201)

      new_subscription = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
