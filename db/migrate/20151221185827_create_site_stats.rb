class CreateSiteStats < ActiveRecord::Migration
  def change
    create_table :site_stats do |t|
      t.integer :doc_site_id
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :url
      t.string :hours
      t.integer :review_count
      t.integer :one_star_count
      t.integer :five_star_count
      t.float :avg_rating
      t.integer :search_rank
      t.boolean :first_page

      t.timestamps null: false
    end
  end
end
