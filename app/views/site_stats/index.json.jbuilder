json.array!(@site_stats) do |site_stat|
  json.extract! site_stat, :id, :doc_site_id, :address_1, :address_2, :city, :state, :zip, :phone, :url, :hours, :review_count, :one_star_count, :five_star_count, :avg_rating, :search_rank, :first_page
  json.url site_stat_url(site_stat, format: :json)
end
