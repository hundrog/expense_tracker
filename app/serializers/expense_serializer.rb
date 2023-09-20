class ExpenseSerializer < BaseSerializer
  attributes(:id, :name, :amount)

  attribute :category_color do
    expense.category.color
  end
end
