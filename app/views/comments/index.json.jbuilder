json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :post_id, :comment
  json.url comment_url(comment, format: :json)
end
