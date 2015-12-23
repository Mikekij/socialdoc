class AddProcessedDateToSiteStat < ActiveRecord::Migration
  def change
    add_column :site_stats, :processed_date, :date
  end
end
