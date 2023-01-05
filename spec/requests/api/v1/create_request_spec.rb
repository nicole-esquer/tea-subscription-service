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

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to have_key(:data)
      expect(results[:data]).to have_key(:id)
      expect(results[:data]).to have_key(:type)
      expect(results[:data][:type]).to eq('subscriptions')

      expect(results[:data]).to have_key(:attributes)
      expect(results[:data][:attributes]).to have_key(:title)
      expect(results[:data][:attributes][:title]).to eq('Flavorful, delicious teas of India')
      expect(results[:data][:attributes]).to have_key(:price)
      expect(results[:data][:attributes][:price]).to eq(15.5)
      expect(results[:data][:attributes]).to have_key(:status)
      expect(results[:data][:attributes][:status]).to eq('active')
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

      subscription_params = {
        title: 'Flavorful, delicious teas of India',
        price: '',
        frequency: 3,
        tea_id: tea.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      post "/api/v1/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription_params)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
    end
  end
end
