class CreateDocSites < ActiveRecord::Migration
  def change
    create_table :doc_sites do |t|
      t.integer :doc_id
      t.integer :tracked_site_id
      t.string :url

      t.timestamps null: false
    end
  end
end
