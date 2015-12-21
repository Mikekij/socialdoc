json.array!(@doc_sites) do |doc_site|
  json.extract! doc_site, :id, :doc_id, :tracked_site_id, :url
  json.url doc_site_url(doc_site, format: :json)
end
