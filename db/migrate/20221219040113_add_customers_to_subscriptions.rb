class AddCustomersToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :customer, null: false, foreign_key: true
  end
end
