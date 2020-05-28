Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products_url" => "products#all_products_action"
    get "/one_product_url" => "products#one_product_action"
    get "/second_product_url" => "products#second_product_action"

    get "/any_product_url" => "products#any_product_action"
    get "/any_product_url/:id" => "products#any_product_action"
  end
end
