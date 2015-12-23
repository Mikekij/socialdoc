class AddPracticeNameToSiteStat < ActiveRecord::Migration
  def change
    add_column :site_stats, :practice_name, :string
  end
end
