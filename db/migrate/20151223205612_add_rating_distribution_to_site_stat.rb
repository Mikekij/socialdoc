class AddRatingDistributionToSiteStat < ActiveRecord::Migration
  def change
    add_column :site_stats, :rating_distribution, :text
  end
end
