Rails.application.routes.draw do
  defaults export: true do
    resources :expenses
    resources :categories
  end
end
