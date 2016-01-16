json.array!(@bids) do |bid|
  json.extract! bid, :id, :price, :content, :sender_id, :product_id
  json.url bid_url(bid, format: :json)
end
