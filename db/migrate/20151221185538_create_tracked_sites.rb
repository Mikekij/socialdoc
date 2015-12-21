class CreateTrackedSites < ActiveRecord::Migration
  def change
    create_table :tracked_sites do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
