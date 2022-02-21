json.extract! item, :id, :title, :price, :description, :category_id, :location,
              :image, :seller_id, :buyer_id, :created_at, :updated_at
json.url item_url(item, format: :json)
