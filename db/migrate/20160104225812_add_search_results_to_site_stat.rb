class AddSearchResultsToSiteStat < ActiveRecord::Migration
  def change
    add_column :site_stats, :search_results, :text
  end
end
