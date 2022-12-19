class Subscription < ApplicationRecord
  validates_presence_of :title,
                        :price,
                        :status,
                        :frequency

  enum status: { active: 0, cancelled: 1 }
  enum frequency: { weekly: 0, biweekly: 1, monthly: 2, quarterly: 3, annually: 4 }

  belongs_to :tea
  belongs_to :customer
end
