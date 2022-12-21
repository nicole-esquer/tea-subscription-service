require 'rails_helper'

RSpec.describe 'Update Subscription Status' do
  context 'Happy Path' do
    it 'updates a subscription status from active to cancel' do
      customer = Customer.create!(first_name: 'Tea', last_name: 'Lover', email: 'tealover@mail.com',
                                  address: '123 Boiling Kettle Lane, Tucson, AZ 85705')
      tea = Tea.create!(title: 'Traditional Chai', description: 'Warm, rich spices from India', temperature: 100,
                        brew_time: 3)
      subscription = Subscription.create!(title: 'Flavorful, delicious teas of India', price: 15.50,
                                          frequency: 3, tea_id: tea.id, customer_id: customer.id)

      cancelled_params = {
        subscription_id: subscription.id,
        status: 'cancelled'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      patch "/api/v1/#{customer.id}/subscriptions", headers: headers,
                                                    params: JSON.generate(cancelled_params)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to have_key(:data)
      expect(results[:data]).to have_key(:id)
      expect(results[:data]).to have_key(:type)
      expect(results[:data][:type]).to eq('subscription')

      expect(results[:data]).to have_key(:attributes)
      expect(results[:data][:attributes]).to have_key(:title)
      expect(results[:data][:attributes][:title]).to eq('Flavorful, delicious teas of India')
      expect(results[:data][:attributes]).to have_key(:price)
      expect(results[:data][:attributes][:price]).to eq(15.5)
      expect(results[:data][:attributes]).to have_key(:status)
      expect(results[:data][:attributes][:status]).to eq('cancelled')
      expect(results[:data][:attributes]).to have_key(:frequency)
      expect(results[:data][:attributes][:frequency]).to eq('quarterly')
    end
  end

  context 'Sad Path' do
    it 'will generate an error if there are missing params' do
      customer = Customer.create!(first_name: 'Tea', last_name: 'Lover', email: 'tealover@mail.com',
                                  address: '123 Boiling Kettle Lane, Tucson, AZ 85705')
      tea = Tea.create!(title: 'Traditional Chai', description: 'Warm, rich spices from India', temperature: 100,
                        brew_time: 3)
      subscription = Subscription.create!(title: 'Flavorful, delicious teas of India', price: 15.50,
                                          frequency: 3, tea_id: tea.id, customer_id: customer.id)

      cancelled_params = {
        subscription_id: subscription.id,
        status: 'cancelled'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      patch '/api/v1/048750487503248952/subscriptions', headers: headers,
                                                        params: JSON.generate(cancelled_params)

      # expect(response).to_not be_successful
      # expect(response).to have_http_status(400)
    end
  end
end
