json.extract! message, :id, :seller_id, :buyer_id, :item_id, :created_at,
              :updated_at
json.url message_url(message, format: :json)
