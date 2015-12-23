class AddDocNameToSiteStat < ActiveRecord::Migration
  def change
    add_column :site_stats, :doc_name, :string
  end
end
