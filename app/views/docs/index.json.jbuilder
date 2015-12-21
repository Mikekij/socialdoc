json.array!(@docs) do |doc|
  json.extract! doc, :id, :first_name, :last_name, :title, :homepage_url, :address_1, :address_2, :city, :state, :zip, :phone, :personal_phone, :email
  json.url doc_url(doc, format: :json)
end
