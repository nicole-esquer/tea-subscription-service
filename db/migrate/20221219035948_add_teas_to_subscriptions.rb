class AddTeasToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :tea, null: false, foreign_key: true
  end
end
