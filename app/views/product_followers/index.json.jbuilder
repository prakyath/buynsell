json.array!(@product_followers) do |product_follower|
  json.extract! product_follower, :id, :product_id, :follower_id
  json.url product_follower_url(product_follower, format: :json)
end
