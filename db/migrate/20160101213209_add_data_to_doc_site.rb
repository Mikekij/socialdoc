class AddDataToDocSite < ActiveRecord::Migration
  def change
    add_column :doc_sites, :data_1, :string
    add_column :doc_sites, :data_2, :string
    add_column :doc_sites, :data_3, :string
    add_column :doc_sites, :data_4, :string
  end
end
