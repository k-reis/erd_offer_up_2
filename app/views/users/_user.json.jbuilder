json.extract! user, :id, :email, :password, :seller_id, :buyer_id, :name,
              :created_at, :updated_at
json.url user_url(user, format: :json)
