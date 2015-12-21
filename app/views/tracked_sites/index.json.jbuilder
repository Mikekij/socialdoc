json.array!(@tracked_sites) do |tracked_site|
  json.extract! tracked_site, :id, :name, :url
  json.url tracked_site_url(tracked_site, format: :json)
end
