class Expense < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :category
end
